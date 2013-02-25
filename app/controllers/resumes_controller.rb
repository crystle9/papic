class ResumesController < ApplicationController
  before_filter :authenticate
  before_filter :load_job
  before_filter :verify_user, :only => [:update, :destroy]
  before_filter :have_checker_permission, :only => [:accept]
  
  def create
    @resume = @job.resumes.new(params[:resume])
    @resume.user_id = current_user.id
    @resume.save
    respond_with @resume, :location => @job
  end
  
  def update
    @resume.update_attributes(params[:resume])
    respond_with @resume
  end

  def destroy
    @resume.destroy
    respond_with @resume, :location => @job
  end
  
  def accept
    @job.update_attributes(params[:job])
    respond_with @job
  end
  
  private
    def load_job
      @job = Job.find(params[:job_id])
    end
  
    def verify_user
      @resume = @job.resumes.find(params[:id])
      if (@resume.user_id != current_user)
        redirect_to @job
      end
    end
    
    def have_checker_permission
      if !current_user.have_checker_permission(@job)
        redirect_to @job
      end
    end
end
