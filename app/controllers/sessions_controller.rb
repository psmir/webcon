class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    run User::Authenticate::Present
  end

  def create
    run User::Authenticate do |result|
      session[:user_id] = result[:user].id
      return redirect_to after_sign_in_path, success: t(:greeting)
    end

    redirect_to new_session_path, alert: t(:wrong_credentials)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def after_sign_in_path
    current_user.consultant? ? consultant_panel_path : dashboard_path
  end
end
