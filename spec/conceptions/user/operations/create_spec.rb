# frozen_string_literal: true

require 'rails_helper'

describe User::Create do
  let(:email) { 'good@email.local' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }
  let(:role) { 'client' }

  let(:params) do
    { 
      params: {
        user: {
          email: email,
          password: password,
          password_confirmation: password_confirmation,
          role: role
        }
      }
    }
  end

  subject { User::Create.(params) }

  it do
    is_expected.to be_success
  end

  context 'wrong confirmation' do
    let(:password_confirmation) { 'aaa' }

    it do
      is_expected.to be_failure
      expect(subject["contract.default"].errors[:password_confirmation])
        .to include('must be equal to password')
    end
  end

  context 'wrong role' do
    let(:role) { 'admin' }

    it { is_expected.to be_failure }
  end

  context 'wrong email' do
    let(:email) { 'wrong' }

    it do
      is_expected.to be_failure
      expect(subject["contract.default"].errors[:email]).to include('is in invalid format')
    end
  end
end
