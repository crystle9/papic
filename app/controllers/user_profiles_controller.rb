class UserProfilesController < ApplicationController
  respond_to :html
  
  before_filter :authenticate
  before_filter :load_user
  before_filter :dump_profile, :only => [:create, :update]
  before_filter :first_create, :only => [:new, :create]
  before_filter :load_user_profile, :except => [:new, :create]
  
  def new
    @user_profile = @user.build_user_profile
    case @user.role
    when 'student' then @user_profile.build_student_profile
    when 'company' then @user_profile.build_company_profile
    end
    @user_profile.contacts.new
    respond_with(@user_profile)
  end
  
  def create
    @user_profile = @user.build_user_profile(params[:user_profile])
    @user_profile.save
    respond_with(@user_profile, :locaton => @user)
  end
  
  def edit
    respond_with(@user_profile)
  end

  def update
    @user_profile.update_attributes(params[:user_profile])
    respond_with(@user_profile, :location => @user)
  end
  
  private
    def dump_profile
      profile = params[:user_profile]
      if @user.role != 'student' then profile.delete(:student_profile_attributes) end
      if @user.role != 'company' then profile.delete(:company_profile_attributes) end
    end
    
    def first_create
      if !!@user.user_profile
        redirect_to edit_user_profile_url
      end
    end
    
    def load_user_profile
      if @user.user_profile.nil?
        redirect_to new_user_profile_url,
          alert: t('flash.user_profile.need_to_create_user_profile')
      else
        @user_profile = @user.user_profile
      end
    end
end
