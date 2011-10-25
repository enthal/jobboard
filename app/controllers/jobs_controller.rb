class JobsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :forbid_unless_job_belongs_to_current_user!, :only => [:edit, :update, :destroy]
  
  # NOTE: https://github.com/josevalim/inherited_resources
  # NOTE: inherited_resources mixes in boilerplate CRUD code, at ApplicationController
  respond_to :html
  
  # TODO: should be in module JobsHelper?
  def forbid_unless_job_belongs_to_current_user!
    return true if user_signed_in? and Job.find(params[:id]).try(:user) == current_user
    flash[:notice] = "User does not own this job; access denied"
    head :forbidden
    false
  end

  def create
    @job = Job.new(params[:job])
    @job.user = current_user
    create!
  end
  
  def send_message
    job = Job.find(params[:id])
    user = User.find(params[:user_id])
    message = Message.create(job: job, user: user, body: params[:body])
    redirect_to job, notice: 'Sent message to job poster!'
  end
  
end
