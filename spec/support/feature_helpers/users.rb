# frozen_string_literal: true

module FeatureHelpers
  module Users
    def create_user(params = {})
      User.create(
        email: params[:email],
        password: params[:password]
      )
    end

    def sign_in(user)
      visit new_session_path
      fill_in t(:email), with: user.email
      fill_in t(:password), with: user.password
      click_button t(:sign_in)
      expect(page).to have_link t(:sign_out)
    end
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers::Users, type: :feature
end
