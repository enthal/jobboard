require 'spec_helper'

describe JobsController do
  include Devise::TestHelpers
  
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
  
  end

end
