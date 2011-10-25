class JobsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  respond_to :html, :json
  
  # NOTE: https://github.com/josevalim/inherited_resources
  # NOTE: inherited_resources mixes in boilerplate CRUD code, at ApplicationController

  def create
    @job = Job.new(params[:job])
    @job.user = current_user
    create!
  end
end
