require 'rails_helper'

describe 'Sign In' do
  let!(:user) { create_user(email: 'tester@good.local', password: 'password') }

  before do
    visit root_path
    click_link 'Вход'
    fill_in 'Email', with: 'tester@good.local'
    fill_in 'Password', with: 'password'
    click_button 'Вход'
  end

  it do
    expect(page).to have_content 'Добро пожаловать!'
    expect(current_path).to eq dashboard_path
  end
end