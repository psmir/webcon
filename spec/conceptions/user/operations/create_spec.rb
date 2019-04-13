# frozen_string_literal: true

require 'rails_helper'

describe User::Create do
  let(:email) { 'good@email.local' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }
  let(:role) { 'client' }
  let!(:some_user) { nil }

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
      expect(subject['contract.default'].errors[:password_confirmation])
        .to include(t('errors.rules.password_confirmation.eql?'))
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
      expect(subject['contract.default'].errors[:email]).to include(t('errors.format?'))
    end
  end

  context 'email is taken' do
    context 'for the current role' do
      let!(:some_user) { User::Create.(params) }

      it do
        is_expected.to be_failure
        expect(subject['contract.default'].errors[:email]).to include(t('errors.unique?'))      
      end
    end

    context 'for another role' do
      let(:some_params) do
        {
          params: {
            user: {
              email: email,
              password: password,
              password_confirmation: password_confirmation,
              role: 'consultant'
            }
          }
        }
      end

      let!(:some_user) { User::Create.(some_params) }

      it { is_expected.to be_success }
    end
  end
end
