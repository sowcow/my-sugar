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



## CAUTION: not tested area
def require_delegation
  require 'active_support/core_ext/module/delegation'
end

def require_bundle
  require 'bundler'
  Bundler.require
end
alias require_bundler require_bundle

def require_all mask
  Dir[mask].each { |x| require_relative x }
end
###########################



# monkeys out of the zoo!
class Module
  def is *others; include *others end
end
# ..
# to get method names I used:
# >> p methods = Enumerable.instance_methods.select {|x| Enumerable.instance_method(x).arity == 0 }
# no bang(!) versions
module Enumerable
  methods = [:sort, :sort_by, :find_all, :select, :reject, :collect, :map, :flat_map,
             :collect_concat, :partition, :group_by, :all?, :any?, :one?, :none?, :min,
             :max, :minmax, :min_by, :max_by, :minmax_by, :take_while, :drop_while]
  methods.each do |name|
    define_method name[/^.*[^\?]/]+'_' do |&block|
      send name, &x(&block)
    end
  end
end