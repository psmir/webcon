# frozen_string_literal: true

require 'rails_helper'

describe 'consultant_profile/edit', js: true do
  subject { page }
  let(:user) { create_user role: 'consultant' }
  let(:description) { Faker::Lorem.paragraph_by_chars(100, false) }

  before do
    sign_in user
  end

  context 'user is a consultant' do
    before do
      click_link t(:profile)
      fill_in t(:description), with: description
      click_button t(:save)
    end

    context 'success' do
      it { is_expected.to have_content t(:profile_updated) }
    end

    context 'failure' do
      let(:description) { nil }

      it { is_expected.to have_inline_error(t('errors.filled?')).for_field(t(:description)) }
    end
  end

  context 'user is not a consultant' do
    let!(:user) { create_user role: 'client' }

    it 'does not show the link' do
      is_expected.to have_no_link t(:profile)
    end

    context 'direct access' do
      before do
        visit edit_consultant_profile_path
      end

      it { is_expected.to have_content t(:authorization_error) }
    end
  end
end
