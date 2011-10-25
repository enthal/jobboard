class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  # NOTE: https://github.com/josevalim/inherited_resources
  # NOTE: inherited_resources mixes in boilerplate CRUD code, at ApplicationController
  respond_to :html
  
  def index
    @messages = Message.all.select { |message| message.job.user == current_user }  # TODO use a query!! DO NOT just load all the messages
    index!
  end
end
