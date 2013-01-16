require 'my-sugar'

describe MySugar do

  specify 'light block' do
    (  [1,2,3].all? &x{ is_a? Integer }  ).should be_true
    (  [1,2,3].any? &x{ is_a? String }   ).should be_false
  end

  specify 'is == include' do
    module Testable; def test; 'here' end end
    class Any; is Testable end
    Any.new.test.should == 'here'
  end

  specify 'delegation' do
    module Nighbour; def self.test!; 'here!' end end
    class Other; delegate :test!, to: :Nighbour end
    Other.new.test!.should == 'here!'
  end

end