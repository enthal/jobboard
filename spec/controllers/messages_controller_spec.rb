require 'spec_helper'

describe MessagesController do
  include Devise::TestHelpers
  
  # NOTE: https://github.com/josevalim/inherited_resources
  # NOTE: inherited_resources mixes in boilerplate CRUD code, at ApplicationController
  
  context "signed in as user 1, who has posted a job for which there is one message from user 2, who posted a job for which there is one message from user 1" do
    let(:user1)    { Factory.create(:user) }
    let(:user2)    { Factory.create(:user) }
    let(:job1)     { Factory.create(:job, user: user1) }
    let(:job2)     { Factory.create(:job, user: user2) }
    let(:message1) { Factory.create(:message, user: user2, job: job1) }
    let(:message2) { Factory.create(:message, user: user1, job: job2) }
    before do
      sign_in user1
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
