require 'spec_helper'

describe JobsController do
  include Devise::TestHelpers
  
  describe "disallow member-user-only actions when not logged in (guest/unprivileged)" do
    let(:job) { Factory.create(:job) }
    
    after { response.should redirect_to new_user_session_path }  # Thanks, devise!
    
    it { get :new }
    it { get :edit, :id => job }
    it { post :create, :job => FactoryGirl.attributes_for(:job) }
    it { put :update, :id => job, :job => {'these' => 'params'} }
    it { delete :destroy, :id => job }
  end
end
