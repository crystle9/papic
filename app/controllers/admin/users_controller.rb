class Admin::UsersController < Admin::AdminController
  before_filter :authenticate
  before_filter :require_admin
  
  def index
    respond_with @users = User.page(params[:page])
  end
  
  def change_state
    @user = User.find(params[:id])
    @user.is_frozen = params[:user][:is_frozen]
    @user.save
    respond_with @user
  end
  
  def change_role
    @user = User.find(params[:id])
    @user.role = params[:user][:role]
    @user.save
    respond_with @user
  end
end