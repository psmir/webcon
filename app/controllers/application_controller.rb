class ApplicationController < ActionController::Base
  add_flash_types :success, :error

  helper_method :current_user
  before_action :require_login

  private

  def require_login
    redirect_to new_session_path unless current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    else
      @current_user = nil
    end
  end
end
