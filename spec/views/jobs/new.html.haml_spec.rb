require 'spec_helper'

describe "jobs/new.html.haml" do
  before do
    assign :job, Factory.create(:job)
  end

  it "renders new job form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jobs_path, :method => "post" do
      assert_select "input#job_title", :name => "job[title]"
      assert_select "input#job_company", :name => "job[company]"
      assert_select "textarea#job_description", :name => "job[description]"
    end
  end
end
