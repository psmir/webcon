# frozen_string_literal: true

class ConsultantProfile::Update < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Policy::Pundit(ConsultantProfilePolicy, :present?)
    step :get_consultant_profile
    step Contract::Build(constant: ConsultantProfile::Contract::Update)

    private

    def get_consultant_profile(options, **)
      options[:model] = options[:current_user].consultant_profile
      options[:model]
    end
  end

  step Nested(Present)
  step Contract::Validate(key: :consultant_profile)
  step Contract::Persist()
  success :attach_photo_if_needed
  success :remove_photo_if_needed


  private

  def attach_photo_if_needed(options, params:, **)
    return if params[:consultant_profile][:photo].blank?
    options[:model].photo.attach(params[:consultant_profile][:photo])
  end

  def remove_photo_if_needed(options, params:, **)
    options[:model].photo.try(:purge) if params[:consultant_profile][:remove_photo] == '1'
  end
end
