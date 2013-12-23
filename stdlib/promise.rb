class Promise
  def self.value(value)
    new.resolve(value)
  end

  def self.error(value)
    new.reject(value)
  end

  def self.when(*promises)
    When.new(promises.flatten)
  end

  attr_reader :value, :error, :prev, :next

  def initialize(success = nil, failure = nil)
    @success = success
    @failure = failure

    @realized = nil
    @value    = nil
    @error    = nil
    @delayed  = nil

    @prev = nil
    @next = nil
  end

  def act?
    @success != nil
  end

  def realized?
    @realized != nil
  end

  def resolved?
    @realized == :value
  end

  def rejected?
    @realized == :error
  end

  def ^(promise)
    promise << self
    self    >> promise

    promise
  end

  def <<(promise)
    @prev = promise

    self
  end

  def >>(promise)
    @next = promise

    if resolved?
      promise.resolve(@delayed || value)
    elsif rejected? && (!@failure || Promise === (@delayed || @error))
      promise.reject(@delayed || error)
    end

    self
  end

  def resolve(value)
    if realized?
      raise ArgumentError, 'the promise has already been realized'
    end

    if Promise === value
      value << @prev

      return value ^ self
    end

    @realized = :value
    @value    = value

    if @success
      value = @success.call(value)
    end

    if @next
      @next.resolve(value)
    else
      @delayed = value
    end

    self
  end

  def reject(value)
    if realized?
      raise ArgumentError, 'the promise has already been realized'
    end

    if Promise === value
      value << @prev

      return value ^ self
    end

    @realized = :error
    @error    = value

    if @failure
      value = @failure.call(value)

      if Promise === value
        if @next
          @next.reject(value)
        else
          @delayed = value
        end
      end
    else
      if @next
        @next.reject(value)
      else
        @delayed = value
      end
    end

    self
  end

  def then(&block)
    self ^ Promise.new(block)
  end

  alias do then

  def fail(&block)
    self ^ Promise.new(nil, block)
  end

  alias rescue fail
  alias catch fail

  def always(&block)
    self ^ Promise.new(block, block)
  end

  alias finally always
  alias ensure always

  def collect(&block)
    self ^ Collect.new(block)
  end

  def inspect
    result = "#<#{self.class}(#{object_id})"

    if @next
      result += " >> #{@next.inspect}"
    end

    if realized?
      result += ": #{(@value || @error).inspect}>"
    else
      result += ">"
    end

    result
  end

  class Collect < self
    def self.it(promise)
      unless promise.realized?
        raise ArgumentError, "the promise hasn't been realized"
      end

      current = promise.act? ? [promise.value] : []

      if prev = promise.prev
        current.concat(it(prev))
      else
        current
      end
    end

    def initialize(block)
      super -> {
        block.call(*Collect.it(self).reverse)
      }
    end
  end

  class When < self
    def initialize(promises = [])
      super()

      @wait = []

      promises.each {|promise|
        wait promise
      }
    end

    def wait(promise)
      @wait << promise

      promise.always {
        try if @next
      }

      self
    end

    def >>(*)
      super.tap {
        try
      }
    end

    def try
      if @wait.all?(&:realized?)
        if promise = @wait.find(&:rejected?)
          reject(promise.error)
        else
          resolve(@wait.map(&:value))
        end
      end
    end

    def and(&block)
      wait Promise.new(block)
    end
  end
end
