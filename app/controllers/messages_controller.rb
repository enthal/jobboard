class MessagesController < ApplicationController
  before_filter :authenticate_user!
  
  # NOTE: https://github.com/josevalim/inherited_resources
  # NOTE: inherited_resources mixes in boilerplate CRUD code, at ApplicationController
  respond_to :html
  
  def index
    @messages = Message .joins(:job) .where('jobs.user_id' => current_user)
    index!
  end
end
