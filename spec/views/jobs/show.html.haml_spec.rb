require 'spec_helper'

describe "jobs/show.html.haml" do
  include Devise::TestHelpers

  before do
    @job = assign :job, Factory.create(:job)
  end

  it "renders attributes in <p>" do
    render
    
    Factory.attributes_for(:job).each_value do |value|
      rendered.should match(/#{value}/)
    end
  end
end
