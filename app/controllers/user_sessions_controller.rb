class UserSessionsController < ApplicationController
  before_filter :authenticate, :only => :destroy
  respond_to :html
  layout "public"
  def new
    @user_session = UserSession.new
    respond_with @user_session
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    @user_session.save
    respond_with @user_session, :location => root_url
  end

  def destroy
    current_user_session.destroy
    redirect_to root_path
  end
end
