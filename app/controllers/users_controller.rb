# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login
  def new
    run User::Create::Present
  end

  def create
    run User::Create do |result|
      return redirect_to new_session_path, success: t(:signed_up_message)
    end
    render :new
  end
end
