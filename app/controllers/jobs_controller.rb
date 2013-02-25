class JobsController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
  before_filter :have_create_permission, :only => [:create]
  before_filter :have_checker_permission, :only => [:edit, :update]
  layout 'public', :only => [:index, :show]
  
  def index
    case params[:category]
    when 'campus' then @jobs = Job.campus.page(params[:page])
    when 'tutor'  then @jobs = Job.tutor.page(params[:page])
    when 'parttimes' then @jobs = Job.parttimes.page(params[:page])
    else @jobs = Job.page(params[:page])
    end
  end

  def show
    @job = Job.find(params[:id])
    if @job.state == 'valid' && current_user && !current_user.have_checker_permission_for(@job)
      @resume = @job.resumes.find_or_initialize_by_user_id(current_user.id)
    end
    @gmap = @job.job_profile.to_gmaps4rails
  end

  def new
    @category = params[:category] || 'campus'
    @job = Job.new(:category => @category)
    @job.build_job_profile
    if @category == 'tutor' then @job.build_child_profile end
    if current_user.is_admin?
      @job.build_user_profile
      case @category
      when 'campus' then @job.user_profile.build_student_profile
      when 'parttimes' then @job.user_profile.build_company_profile
      end
    end
    respond_with @job
  end

  def create
    if current_user.is_admin?
      @job = Job.new(params[:job], :as => :admin)
    else
      @job = Job.new(params[:job])
      @job.user_profile = current_user.user_profile
    end
    valid = current_user.can_create_valid_job_for?(@@category)
    @job.state = valid ? 'valid' : 'invalid'
    @job.save
    respond_with @job
  end

  def edit
    respond_with @job
  end

  def update
    @job.update_attributes(params[:job])
    respond_with @job
  end
  
  private
    def have_checker_permission
      @job = Job.find(params[:id])
      if !current_user.have_checker_permission_for(@job)
        redirect_to @job
      end
    end
    
    def have_create_permission
      @@category = params[:job][:category]
      if !current_user.can_create_job_for?(@@category)
        redirect_to new_job_url
      end
    end
end
