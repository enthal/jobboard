require 'spec_helper'

describe "jobs/index.html.haml" do
  include Devise::TestHelpers
  
  let(:jobs) { [Factory.create(:job)] * 2 }
  before(:each) { assign :jobs, jobs }

  context "guest" do
    it "renders a list of jobs without edit or delete links" do
      render
      Factory.attributes_for(:job).each_value do |value|
        assert_select "tr>td", :text => value.to_s, :count => 2
      end
      jobs.each do |job|
        assert_select "tr>td>a[href=#{job_path(job)}]"
        assert_select "tr>td>a[href=#{edit_job_path(job)}]", false
        assert_select "tr>td>a[href=#{job_path(job)}][data-method]", false
      end
    end
  end

  context "logged in" do
    let(:user) { Factory.create(:user) }
    before do
      sign_in user
      render
    end
    it "also includes edit and delete links for each job" do
      jobs.each do |job|
        assert_select "tr>td>a[href=#{edit_job_path(job)}]"
        assert_select "tr>td>a[href=#{job_path(job)}][data-method]"
      end
    end
  end
  
end
