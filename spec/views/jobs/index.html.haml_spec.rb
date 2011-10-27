require 'spec_helper'

describe "jobs/index.html.haml" do
  include Devise::TestHelpers
  
  let(:jobs) { Array.new(2) { Factory.create(:job) } }
  before { assign :jobs, jobs }

  context "guest" do
    it "renders a list of jobs without edit or delete links" do
      render
      Factory.attributes_for(:job).each_value do |value|
        assert_select "tr>td", :text => value.to_s, :count => 2
      end
      jobs.each do |job|
        assert_select "tr>td>a[href=#{     job_path(job)}]"
        assert_select "tr>td>a[href=#{edit_job_path(job)}]", false
        assert_select "tr>td>a[href=#{     job_path(job)}][data-method]", false
      end
    end
  end

  context "logged in" do
    it "also includes edit and delete links for job created by this user only" do
      sign_in User.last
      render
      
      assert_select "tr>td>a[href=#{edit_job_path(Job.first)}]", false
      assert_select "tr>td>a[href=#{     job_path(Job.first)}][data-method]", false
      
      assert_select "tr>td>a[href=#{edit_job_path(Job.last)}]"
      assert_select "tr>td>a[href=#{     job_path(Job.last)}][data-method]"
    end
  end
  
end
