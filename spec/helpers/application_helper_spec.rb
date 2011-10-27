require 'spec_helper'

describe ApplicationHelper do
  describe '#paragraph_prefix' do
    it "returns the first n (default=50) characters of the first line of the given text" do
      helper.paragraph_prefix("123").should == "123"
      helper.paragraph_prefix("a"*55).should == "a"*50
      helper.paragraph_prefix("12345",3).should == "123"
      helper.paragraph_prefix("12345\n67",3).should == "123"
      helper.paragraph_prefix("12345\n67").should == "12345"
      helper.paragraph_prefix("a b c \n d e").should == "a b c "
    end
  end
end
