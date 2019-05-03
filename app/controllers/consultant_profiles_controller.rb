# frozen_string_literal: true

class ConsultantProfilesController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    perform ConsultantProfile::Index
  end

  def edit
    perform ConsultantProfile::Update::Present
  end

  def update
    perform ConsultantProfile::Update do
      redirect_to edit_consultant_profile_path, notice: t(:profile_updated)
    end
  end
end
