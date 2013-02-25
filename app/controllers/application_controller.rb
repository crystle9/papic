require "application_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  self.responder = ApplicationResponder
  respond_to :html

  before_filter :set_locale
  helper_method :current_user_session, :current_user

  public
    def current_user
      @current_user ||= current_user_session && current_user_session.user
    end
  
  protected
    def set_locale
      if params[:locale]
        I18n.locale = params[:locale]
      else
        redirect_to url_for(:locale => I18n.default_locale)
      end
    end
    
    def current_user_session
      @current_user_session ||= UserSession.find
    end
    
    def authenticate
      unless current_user
        redirect_to signin_path, :alert => t("application.authenticate.alert")
      end
    end
    
    def load_user
      @user = current_user
    end
end
