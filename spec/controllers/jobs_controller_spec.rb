require 'spec_helper'

describe JobsController do
  include Devise::TestHelpers
  
  # NOTE: https://github.com/josevalim/inherited_resources
  # NOTE: inherited_resources mixes in boilerplate CRUD code, at ApplicationController
  
  describe "disallow member-user-only actions when not logged in (guest/unprivileged)" do
    let(:job) { Factory.create(:job) }
    
    after { response.should redirect_to new_user_session_path }  # Thanks, devise!
    
    it { get :new }
    it { get :edit, :id => job }
    it { post :create, :job => Factory.attributes_for(:job) }
    it { put :update, :id => job, :job => {'these' => 'params'} }
    it { delete :destroy, :id => job }
  end
  
  context "logged in" do
    let(:user) { Factory.create(:user) }
    before do
      sign_in user
    end
    
    describe "POST create" do
      it "assigns a newly created job as @job, whose user is current user" do
        post :create, :job => Factory.attributes_for(:job)
        assigns(:job).should be_a(Job)
        assigns(:job).should be_persisted
        assigns(:job).user.should == user
      end
    end
  
    describe "forbid editing and deleting jobs not created by current_user" do
      let(:user2) { Factory.create(:user, email: 'user2@example.com') }
      let(:job)   { Factory.create(:job, user: user2) }
      let(:job_edited_params) { Factory.attributes_for(:job).merge(title:'wonky!')}
      
      before { job }
      after do
        response.status.should == 403  # TODO: what should the user actually see? This case should never happen in normal use, but isn't impossible; we should show something
        Job.all.should == [job]
        Job.first.title.should_not == 'wonky!'
        Job.first.title.should == Factory.attributes_for(:job)[:title]
      end

      it { get :edit, :id => job }
      it { put :update, :id => job, :job => job_edited_params }
      it { delete :destroy, :id => job }
    end
  
    describe "POST send_message" do
      let(:job) { Factory.create(:job) }

      it "creates a new Message belonging to context User, Job" do
        Message.count.should == 0
        post :send_message, :id => job, :user_id => user, :body => 'words words words'
        Message.count.should == 1
        user.messages.should == Message.all
        job .messages.should == Message.all
      end
    end
    
  end

end
