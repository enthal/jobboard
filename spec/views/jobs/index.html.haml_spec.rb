require 'spec_helper'

describe "jobs/index.html.haml" do
  include Devise::TestHelpers
  
  let(:jobs) { [Factory.create(:job)] * 2 }
  before(:each) { assign :jobs, jobs }

  it "renders a list of jobs" do
    render
    Factory.attributes_for(:job).each_value do |value|
      assert_select "tr>td", :text => value.to_s, :count => 2
    end
  end
  
end
