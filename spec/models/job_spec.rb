require 'spec_helper'

describe Job do
  describe 'validation' do
    
    it 'is valid from FactoryGirl' do
      job = FactoryGirl.build(:job)
      job.should be_valid
    end
    
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(3) }
    it { should validate_presence_of(:company) }
    it { should ensure_length_of(:company).is_at_least(2) }
    it { should validate_presence_of(:description) }
    it { should ensure_length_of(:description).is_at_least(10) }
  end
end
