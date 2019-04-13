# frozen_string_literal: true

require 'rails_helper'

describe 'Sign In', js: true do
  let!(:user) do
    User::Create.call(
      params: {
        user: {
          email: 'tester@good.local',
          password: 'password',
          password_confirmation: 'password'
        }
      }
    )
  end

  let(:entered_email) { 'tester@good.local' }

  before do
    visit root_path
    click_link t(:sign_in)
    fill_in t(:email), with: entered_email
    fill_in t(:password), with: 'password'
    click_button t(:sign_in)
  end

  context 'wrong credentials' do
    let(:entered_email) { 'unknown@email.local' }

    it { expect(page).to have_content t(:wrong_credentials) }
  end

  context 'user' do
    it do
      expect(page).to have_content t(:greeting)
      expect(current_path).to eq dashboard_path
    end
  end

  context 'consultant' do
    let!(:user) do
      User::Create.call(
        params: {
          user: {
            email: 'tester@good.local',
            password: 'password',
            password_confirmation: 'password',
            role: 'consultant'
          }
        }
      )
    end

    it do
      expect(page).to have_content t(:greeting)
      expect(current_path).to eq consultant_panel_path
    end
  end
end
