# frozen_string_literal: true

require 'rails_helper'

describe 'Sign Up' do
  let(:email) { 'good@email.local' }
  let(:password) { 'password' }

  before do
    visit new_users_path
    fill_in 'Email', with: email
    select t(:consultant), from: t(:account_type)
    fill_in t(:password), with: 'password', match: :prefer_exact
    fill_in t(:password_confirmation), with: 'password', match: :prefer_exact
    click_button t(:sign_up)
  end

  it do
    expect(page).to have_content t(:signed_up_message)
    expect(current_path).to eq new_session_path
    expect(User.find_by(email: email)).to be_consultant
  end

  context 'invalid form' do
    let(:email) { 'wrong' }
    it { expect(page).to have_inline_error('is in invalid format').for_field('Email')}
  end 
end
