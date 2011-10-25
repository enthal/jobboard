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
      2.times do |i|
        assert_select "tr>td>a[href=/jobs/#{jobs[i].id}]"
        assert_select "tr>td>a[href=/jobs/#{jobs[i].id}/edit]", false
        assert_select "tr>td>a[href=/jobs/#{jobs[i].id}][data-method]", false
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
      2.times do |i|
        assert_select "tr>td>a[href=/jobs/#{jobs[i].id}/edit]"
        assert_select "tr>td>a[href=/jobs/#{jobs[i].id}][data-method=delete]"
      end
    end
  end
  
end
