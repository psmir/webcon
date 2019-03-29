# frozen_string_literal: true

module FeatureHelpers
  module User
    def create_user(params = {})
      Oath.config.sign_up_service.new(
        email: params[:email],
        password: params[:password]
      ).perform
    end
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers::User, type: :feature
end
