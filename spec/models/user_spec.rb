require 'spec_helper'

describe User do
  describe 'validation' do
    
    it 'is valid from FactoryGirl' do
      user = FactoryGirl.build(:user)
      user.should be_valid
    end
    
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(3) }
  end
end
