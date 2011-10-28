class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  # NOTE: https://github.com/josevalim/inherited_resources
  # NOTE: inherited_resources mixes in boilerplate CRUD code, at ApplicationController
  respond_to :html
  
  def index
    # Premature optimization: include the sending user and job with each message if wide results are faster than many queries
    # @messages = current_user.messages_received.includes(:user, :job)
    
    @messages = current_user.messages_received
    index!
  end
end
