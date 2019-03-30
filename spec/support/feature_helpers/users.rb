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
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Вход'
      expect(page).to have_link 'Выход'
    end
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers::Users, type: :feature
end
