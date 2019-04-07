# frozen_string_literal: true

require 'rails_helper'

describe 'Sign Out' do
  let!(:user) { create_user(email: 'good@email.local', password: 'password') }

  before do
    sign_in user
    click_link t(:sign_out)
  end

  it { expect(current_path).to eq root_path }
end