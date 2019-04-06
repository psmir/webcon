# frozen_string_literal: true

require 'rails_helper'

describe 'Sign In' do
  let!(:user) { create_user(email: 'tester@good.local', password: 'password') }

  before do
    visit root_path
    click_link t(:sign_in)
    fill_in t(:email), with: 'tester@good.local'
    fill_in t(:password), with: 'password'
    click_button t(:sign_in)
  end

  it do
    expect(page).to have_content t(:greeting)
    expect(current_path).to eq dashboard_path
  end
end
