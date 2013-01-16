require 'my-sugar'

describe MySugar do

  specify 'light block' do
    (  [1,2,3].map &x{ to_s * 5 + ?! }   ).should == %w[ 11111! 22222! 33333!]
    (  [1,2,3].all? &x{ is_a? Integer }  ).should be_true
    (  [1,2,3].any? &x{ is_a? String }   ).should be_false
  end

  specify 'even more light block all? &x{...}  ==>  all_{...}' do
    (  [1,2,3].map_{ to_s * 5 + ?! }  ).should == %w[ 11111! 22222! 33333!]
    (  [1,2,3].all_{ is_a? Integer }  ).should be_true
    (  [1,2,3].any_{ is_a? String }   ).should be_false
  end

  specify 'is == include' do
    module Testable; def test; 'here' end end
    class Any; is Testable end
    Any.new.test.should == 'here'
  end

  # specify 'delegation [using active_support]' do
  #   require_delegation
  #   module Nighbour; def self.test!; 'here!' end end
  #   class Other; delegate :test!, to: :Nighbour end
  #   Other.new.test!.should == 'here!'
  # end

end