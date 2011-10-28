require 'spec_helper'

describe Message do
  describe 'validation' do
    
    it 'is valid from FactoryGirl' do
      message = FactoryGirl.build(:message)
      message.should be_valid
    end
    
    it { should belong_to(:user) }
    it { should belong_to(:job) }
    
    it { should validate_presence_of(:body) }
    it { should ensure_length_of(:body).is_at_least(1) }
  end
end
