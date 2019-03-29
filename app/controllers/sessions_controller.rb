class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    run Session::Create::Present
  end

  def create
    run Session::Create do |result|
      sign_in result[:user]
      return redirect_to dashboard_path, success: t(:greeting)
    end

    render :new
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
