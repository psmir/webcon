# frozen_string_literal: true

class ConsultantProfilesController < ApplicationController
  def edit
    perform ConsultantProfile::Update::Present
  end

  def update
    perform ConsultantProfile::Update do
      redirect_to edit_consultant_profile_path, notice: t(:profile_updated)
    end
  end
end
