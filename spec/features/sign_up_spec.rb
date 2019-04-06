# frozen_string_literal: true

require 'rails_helper'

describe 'Sign Up' do
  let(:email) { 'good@email.local' }
  let(:password) { 'password' }

  before do
    visit new_users_path
    fill_in 'Email', with: email
    select 'Consultant', from: 'Account Type'
    fill_in 'Password', with: 'password', match: :prefer_exact
    fill_in 'Password confirmation', with: 'password', match: :prefer_exact
    click_button 'Регистрация'
  end

  it do
    expect(page).to have_content 'Регистрация завершена. Вы можете войти.'
    expect(current_path).to eq new_session_path
    expect(User.find_by(email: email)).to be_consultant
  end
end
