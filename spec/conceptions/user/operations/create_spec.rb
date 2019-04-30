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

  context 'client' do
    let!(:operation) { User::Create.(params) }

    it do
      expect(operation).to be_success
    end

    context 'created client' do
      subject { User.find_by(email: email) }

      it do
        expect(subject).to be_client
        expect(subject.consultant_profile).to be_nil
      end
    end

    context 'wrong confirmation' do
      let(:password_confirmation) { 'aaa' }

      it do
        expect(operation).to be_failure
        expect(operation['contract.default'].errors[:password_confirmation])
          .to include(t('errors.rules.password_confirmation.eql?'))
      end
    end

    context 'wrong role' do
      let(:role) { 'admin' }

      it { expect(operation).to be_failure }
    end

    context 'wrong email' do
      let(:email) { 'wrong' }

      it do
        expect(operation).to be_failure
        expect(operation['contract.default'].errors[:email]).to include(t('errors.format?'))
      end
    end

    context 'email is taken' do
      context 'for the current role' do
        let!(:some_user) { User::Create.(params) }

        it do
          expect(operation).to be_failure
          expect(operation['contract.default'].errors[:email]).to include(t('errors.unique?'))      
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

        it { expect(operation).to be_success }
      end
    end
  end

  context 'consutlat' do
    let(:role) { 'consultant' }
    let!(:operation) { User::Create.(params) }

    it do
      expect(operation).to be_success
    end

    describe 'created consultant' do
      subject! { User.find_by(email: email) }

      it do
        expect(subject).to be_consultant
        expect(subject.consultant_profile).to be_present
      end
    end
  end
end
