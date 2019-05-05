# frozen_string_literal: true

class ConsultantProfile::Index < Trailblazer::Operation
  step :fetch_consultant_profiles

  private

  def fetch_consultant_profiles(options, params:, **)
    options[:consultant_profiles] = ConsultantProfile.order('updated_at desc')
      .page(params[:page] || 1).per(9)
  end
end
