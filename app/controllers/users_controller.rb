class UsersController < ApplicationController
  respond_to :html
  
  before_filter :authenticate, :except => [:new, :create]
  before_filter :load_user, :only => [:edit, :update, :destroy]
  before_filter :set_role, :only => [:create]
  
  layout "public", :only => [:new, :create]
  
  ROLES = %w(student parent company guest)
  FROZEN_ROLES = %w(company guest)
  
  def show
    @user = User.find(params[:id])
    @display_full = current_user == @user
    respond_with @user
  end

  def new
    respond_with @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.role = @@role
    @user.is_frozen = FROZEN_ROLES.include?(@@role)
    @user.save
    respond_with @user, :location => new_user_profile_url
  end

  def edit
    respond_with @user
  end

  def update
    @user.update_attributes(params[:user])
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user, :location => sign_out_path
  end
  
  private
    def set_role
      @@role = ROLES.include?(params[:user][:role]) ? params[:user][:role] : 'guest'
      params[:user].delete(:role)
    end
end
