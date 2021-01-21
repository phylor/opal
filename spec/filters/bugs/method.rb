# NOTE: run bin/format-filters after changing this file
opal_filter "Method" do
  fails "Method#<< does not try to coerce argument with #to_proc" # Expected TypeError (callable object is expected) but got: NoMethodError (undefined method `<<' for #<Method: MethodSpecs::Composition#upcase (defined in MethodSpecs::Composition in ruby/core/method/fixtures/classes.rb:192)>)
  fails "Method#<< raises TypeError if passed not callable object" # Expected TypeError (callable object is expected) but got: NoMethodError (undefined method `<<' for #<Method: MethodSpecs::Composition#upcase (defined in MethodSpecs::Composition in ruby/core/method/fixtures/classes.rb:192)>)
  fails "Method#== missing methods returns true for the same method missing"
  fails "Method#== returns true if a method was defined using the other one"
  fails "Method#== returns true if methods are the same"
  fails "Method#== returns true if the two core methods are aliases"
  fails "Method#== returns true on aliased methods"
  fails "Method#=== for a Method generated by respond_to_missing? does not call the original method name even if it now exists" # NameError: undefined method `handled_via_method_missing' for class `MethodSpecs::Methods'
  fails "Method#=== for a Method generated by respond_to_missing? invokes method_missing dynamically" # NameError: undefined method `handled_via_method_missing' for class `MethodSpecs::Methods'
  fails "Method#=== for a Method generated by respond_to_missing? invokes method_missing with the method name and the specified arguments" # NameError: undefined method `handled_via_method_missing' for class `MethodSpecs::Methods'
  fails "Method#=== for a Method generated by respond_to_missing? invokes method_missing with the specified arguments and returns the result" # NameError: undefined method `handled_via_method_missing' for class `MethodSpecs::Methods'
  fails "Method#=== invokes the method with the specified arguments, returning the method's return value" # Expected false to equal 15
  fails "Method#=== raises an ArgumentError when given incorrect number of arguments" # Expected ArgumentError but no exception was raised (false was returned)
  fails "Method#>> composition is a lambda" # NoMethodError: undefined method `>>' for #<Method: MethodSpecs::Composition#pow_2 (defined in MethodSpecs::Composition in ruby/core/method/fixtures/classes.rb:200)>
  fails "Method#>> does not try to coerce argument with #to_proc" # Expected TypeError (callable object is expected) but got: NoMethodError (undefined method `>>' for #<Method: MethodSpecs::Composition#upcase (defined in MethodSpecs::Composition in ruby/core/method/fixtures/classes.rb:192)>)
  fails "Method#>> raises TypeError if passed not callable object" # Expected TypeError (callable object is expected) but got: NoMethodError (undefined method `>>' for #<Method: MethodSpecs::Composition#upcase (defined in MethodSpecs::Composition in ruby/core/method/fixtures/classes.rb:192)>)
  fails "Method#[] for a Method generated by respond_to_missing? does not call the original method name even if it now exists"
  fails "Method#[] for a Method generated by respond_to_missing? invokes method_missing dynamically"
  fails "Method#[] for a Method generated by respond_to_missing? invokes method_missing with the method name and the specified arguments"
  fails "Method#[] for a Method generated by respond_to_missing? invokes method_missing with the specified arguments and returns the result"
  fails "Method#arity for a Method generated by respond_to_missing? returns -1"
  fails "Method#call for a Method generated by respond_to_missing? does not call the original method name even if it now exists"
  fails "Method#call for a Method generated by respond_to_missing? invokes method_missing dynamically"
  fails "Method#call for a Method generated by respond_to_missing? invokes method_missing with the method name and the specified arguments"
  fails "Method#call for a Method generated by respond_to_missing? invokes method_missing with the specified arguments and returns the result"
  fails "Method#clone returns a copy of the method"
  fails "Method#curry returns a curried proc"
  fails "Method#curry with optional arity argument raises ArgumentError when the method requires less arguments than the given arity"
  fails "Method#curry with optional arity argument raises ArgumentError when the method requires more arguments than the given arity"
  fails "Method#curry with optional arity argument returns a curried proc when given correct arity"
  fails "Method#define_method when passed a Proc object and a method is defined inside defines the nested method in the default definee where the Proc was created" # Expected #<#<Class:0x3753c>:0x37538> NOT to have method 'nested_method_in_proc_for_define_method' but it does
  fails "Method#define_method when passed an UnboundMethod object defines a method with the same #arity as the original"
  fails "Method#define_method when passed an UnboundMethod object defines a method with the same #parameters as the original"
  fails "Method#eql? missing methods returns true for the same method missing"
  fails "Method#eql? returns true if a method was defined using the other one"
  fails "Method#eql? returns true if methods are the same"
  fails "Method#eql? returns true if the two core methods are aliases"
  fails "Method#eql? returns true on aliased methods"
  fails "Method#hash returns the same value for builtin methods that are eql?"
  fails "Method#hash returns the same value for user methods that are eql?"
  fails "Method#inspect returns a String containing method arguments" # Expected "#<Method: MethodSpecs::Methods#zero (defined in MethodSpecs::Methods in ruby/core/method/fixtures/classes.rb:49)>".include? "()" to be truthy but was false
  fails "Method#inspect returns a String containing the Module containing the method if object has a singleton class but method is not defined in the singleton class" # Expected "#<Method: MethodSpecs::MySub#bar (defined in MethodSpecs::MyMod in ruby/core/method/fixtures/classes.rb:99)>".start_with? "#<Method: MethodSpecs::MySub(MethodSpecs::MyMod)#bar" to be truthy but was false
  fails "Method#inspect returns a String containing the singleton class if method is defined in the singleton class" # Expected "#<Method: MethodSpecs::MySub#bar (defined in #<Class:#<MethodSpecs::MySub:0x7e4a>> in ruby/core/method/shared/to_s.rb:70)>".start_with? "#<Method: #<MethodSpecs::MySub:0xXXXXXX>.bar" to be truthy but was false
  fails "Method#inspect returns a String including all details" # Expected "#<Method: MethodSpecs::MySub#bar (defined in MethodSpecs::MyMod in ruby/core/method/fixtures/classes.rb:99)>".start_with? "#<Method: MethodSpecs::MySub(MethodSpecs::MyMod)#bar" to be truthy but was false
  fails "Method#inspect shows the metaclass and the owner for a Module instance method retrieved from a class" # Expected "#<Method: Class#include (defined in Module in <internal:corelib/module.rb>:407)>".start_with? "#<Method: #<Class:String>(Module)#include" to be truthy but was false
  fails "Method#name for a Method generated by respond_to_missing? returns the name passed to respond_to_missing?"
  fails "Method#original_name returns the name of the method" # NoMethodError: undefined method `original_name' for #<Method: String#upcase (defined in String in corelib/string.rb:1672)>
  fails "Method#original_name returns the original name even when aliased twice" # NoMethodError: undefined method `original_name' for #<Method: MethodSpecs::Methods#foo (defined in MethodSpecs::Methods in ruby/core/method/fixtures/classes.rb:24)>
  fails "Method#original_name returns the original name when aliased" # NoMethodError: undefined method `original_name' for #<Method: MethodSpecs::Methods#foo (defined in MethodSpecs::Methods in ruby/core/method/fixtures/classes.rb:24)>
  fails "Method#owner for a Method generated by respond_to_missing? returns the owner of the method"
  fails "Method#parameters returns [[:req]] for each parameter for core methods with fixed-length argument lists" # Expected [["req", "other"]] to equal [["req"]]
  fails "Method#parameters returns [[:rest]] for a Method generated by respond_to_missing?"
  fails "Method#parameters returns [[:rest]] for core methods with variable-length argument lists" # NameError: undefined method `delete!' for class `String'
  fails "Method#parameters returns [[:rest]] or [[:opt]] for core methods with optional arguments" # Expected [[["rest"]], [["opt"]]] to include [["opt", "count"]]
  fails "Method#receiver for a Method generated by respond_to_missing? returns the receiver of the method"
  fails "Method#source_location for a Method generated by respond_to_missing? returns nil"
  fails "Method#source_location sets the first value to the path of the file in which the method was defined" # Expected "ruby/core/method/fixtures/classes.rb" to equal "./ruby/core/method/fixtures/classes.rb"
  fails "Method#source_location works for methods defined with a block"
  fails "Method#source_location works for methods defined with an UnboundMethod"
  fails "Method#super_method returns nil when the parent's method is removed"
  fails "Method#super_method returns nil when there's no super method in the parent"
  fails "Method#super_method returns the method that would be called by super in the method"
  fails "Method#to_proc returns a proc that can be used by define_method"
  fails "Method#to_proc returns a proc that can receive a block"
  fails "Method#to_proc returns a proc whose binding has the same receiver as the method" # NoMethodError: undefined method `receiver' for nil
  fails "Method#to_s does not show the defining module if it is the same as the receiver class" # Expected "#<Method:0x80d6>".start_with? "#<Method: MethodSpecs::A#baz" to be truthy but was false
  fails "Method#to_s returns a String containing method arguments" # Expected "#<Method:0x6cc4a>".include? "()" to be truthy but was false
  fails "Method#to_s returns a String containing the Module containing the method if object has a singleton class but method is not defined in the singleton class" # Expected "#<Method:0x6cc94>".start_with? "#<Method: MethodSpecs::MySub(MethodSpecs::MyMod)#bar" to be truthy but was false
  fails "Method#to_s returns a String containing the Module the method is defined in"
  fails "Method#to_s returns a String containing the Module the method is referenced from"
  fails "Method#to_s returns a String containing the method name"
  fails "Method#to_s returns a String containing the singleton class if method is defined in the singleton class" # Expected "#<Method:0x805e>".start_with? "#<Method: #<MethodSpecs::MySub:0xXXXXXX>.bar" to be truthy but was false
  fails "Method#to_s returns a String including all details" # Expected "#<Method:0x80a4>".start_with? "#<Method: MethodSpecs::MySub(MethodSpecs::MyMod)#bar" to be truthy but was false
  fails "Method#to_s shows the metaclass and the owner for a Module instance method retrieved from a class" # Expected "#<Method: Class#include (defined in Module in <internal:corelib/module.rb>:407)>".start_with? "#<Method: #<Class:String>(Module)#include" to be truthy but was false
  fails "Method#unbind keeps the origin singleton class if there is one" # Expected "#<UnboundMethod: Object#foo (defined in #<Class:#<Object:0x39c20>> in ruby/core/method/unbind_spec.rb:37)>".start_with? "#<UnboundMethod: #<Class:#<Object:0x39c20>>#foo" to be truthy but was false
  fails "Method#unbind rebinding UnboundMethod to Method's obj produces exactly equivalent Methods"
end
