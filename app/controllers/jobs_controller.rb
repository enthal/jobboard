class JobsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :forbid_unless_job_belongs_to_current_user!, :only => [:edit, :update, :destroy]
  
  respond_to :html, :json
  
  # NOTE: https://github.com/josevalim/inherited_resources
  # NOTE: inherited_resources mixes in boilerplate CRUD code, at ApplicationController

  def create
    @job = Job.new(params[:job])
    @job.user = current_user
    create!
  end
  
  # TODO: should be in module JobsHelper?
  def forbid_unless_job_belongs_to_current_user!
    return true if user_signed_in? and Job.find(params[:id]).try(:user) == current_user
    flash[:notice] = "User does not own this job; access denied"
    head :forbidden
    false
  end
  
end
