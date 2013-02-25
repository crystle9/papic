class Admin::AdminController < ApplicationController
  before_filter :authenticate
  protected
    def require_admin
      if !current_user.is_admin?
        redirect_to :back
      end
    end
end