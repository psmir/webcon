# frozen_string_literal: true

module ContextBuilders
  module Users
    def create_user(user_params = {})
      params = {
        user: {
          email: Faker::Internet.email,
          password: 'password',
          password_confirmation: 'password',
          role: %w[client consultant].sample
        }
      }

      params[:user].merge! user_params
      User::Create.call(params: params)[:model]
    end
  end
end

RSpec.configure do |config|
  config.include ContextBuilders::Users
end
