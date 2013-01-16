require "my-sugar/version"

module MySugar
  module Stuff
    # [1,2,3].all? &x{ is_a? Integer } # => true
    def x &block
      proc { |obj| obj.instance_eval &block }
    end
  end
end

include MySugar::Stuff # ah..

require 'active_support/core_ext/module/delegation' # oh.. [add to gemspec?]

# monkeys out of the zoo!
class Module
  def is *others; include *others end
end

# ... MySugar#x using mm
# class Object
#   def method_missing name, *a, &block
#     if name =~ /^[^_]+_$/ && respond_to?(:name)
#       ........... map_{}  ==>  map &x {}
#     else super end
#   end 
# end