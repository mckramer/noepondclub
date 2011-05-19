require File.dirname(__FILE__) + '/../spec_helper'

describe Dependent do
  it "should be valid" do
    Dependent.new.should be_valid
  end
end
