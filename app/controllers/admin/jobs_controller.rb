class Admin::JobsController < Admin::AdminController
  def change_state
    @job = Job.find(params[:id])
    @job.state = params[:job][:state]
    @job.save
    respond_with @job
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    respond_with @job
  end
end