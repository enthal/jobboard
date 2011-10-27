require 'spec_helper'

describe MessagesController do
  include Devise::TestHelpers
  
  # NOTE: https://github.com/josevalim/inherited_resources
  # NOTE: inherited_resources mixes in boilerplate CRUD code, at ApplicationController
  
  context "signed in as the user who has posted job1 for which there is message2 from another user, who posted job2 for which there is message1 from the poster of job1" do
    let(:job1)     { Factory.create(:job) }
    let(:job2)     { Factory.create(:job) }
    let(:message1) { Factory.create(:message, user: job2.user, job: job1) }
    let(:message2) { Factory.create(:message, user: job1.user, job: job2) }
    before do
      sign_in job1.user
      message1
      message2
      Message.count.should == 2
    end
  
    describe "GET index" do
      it "assigns only messages whose job's user is current_user (these are messages sent to current_user)" do
      
        get :index
        assigns(:messages).should == [message1]
        Message.all               == [message1, message2]
      end
    end
  end
end
