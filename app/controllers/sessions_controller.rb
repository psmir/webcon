class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    run User::Authenticate::Present
  end

  def create
    run User::Authenticate do |result|
      session[:user_id] = result[:user].id
      return redirect_to dashboard_path, success: t(:greeting)
    end

    redirect_to new_session_path, alert: t(:wrong_credentials)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
