require 'spec_helper'

describe "layouts/application.html.haml" do
  include Devise::TestHelpers
  
  describe "navbar" do
    
    context "guest" do
      it "should show login and register links, but not edit reg or logout links" do
        render
      
        assert_select 'div.navbar' do
          assert_select 'a[href=/users/sign_up]'
          assert_select 'a[href=/users/sign_in]'
      
          assert_select 'a[href=/jobs/new]', false
          assert_select 'a[href=/messages]', false
          assert_select 'a[href=/users/edit]', false
          assert_select 'a[href=/users/sign_out]', false
        end
      end
    end
    
    context "logged in" do
      it "should show user name/email as well as edit reg and logout links, but not login or register links" do
        user = Factory.create(:user)
        sign_in user
        render
      
        assert_select 'div.navbar' do
          assert_select '*', /#{Regexp.quote(user.name)}/
          
          assert_select 'a[href=/jobs/new]'
          assert_select 'a[href=/messages]'
          assert_select 'a[href=/users/edit]'
          assert_select 'a[href=/users/sign_out]'
      
          assert_select 'a[href=/users/sign_up]', false
          assert_select 'a[href=/users/sign_in]', false
        end
      end
    end
    
  end
  
end
