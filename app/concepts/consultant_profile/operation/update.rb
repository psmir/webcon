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
end
