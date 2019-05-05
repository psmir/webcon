# frozen_string_literal: true

require 'rails_helper'

describe 'consultant_profile/edit', js: true do
  subject { page }
  let(:user) { create_user role: 'consultant' }
  let(:name) { Faker::Name.first_name }
  let(:middle_name) { Faker::Name.middle_name }
  let(:surname) { Faker::Name.last_name }
  let(:birthday) { Faker::Date.between(70.years.ago, 20.years.ago) }
  let(:gender) { t(:male) }
  let(:description) { Faker::Lorem.paragraph_by_chars(100, false) }

  before do
    sign_in user
  end

  context 'user is a consultant' do
    before do
      click_link t(:profile)

      fill_in t(:name), with: name
      fill_in t(:middle_name), with: middle_name
      fill_in t(:surname), with: surname
      select gender, from: t(:gender)
      set_date_for('#consultant_profile_birthday', birthday) if birthday.present?
      fill_in t(:description), with: description
      click_button t(:save)
    end

    context 'success' do
      it { is_expected.to have_content t(:profile_updated) }
    end

    context 'failure' do
      let(:name) { nil }
      let(:middle_name) { nil }
      let(:surname) { nil }
      let(:gender) { t(:not_selected) }
      let(:birthday) { nil }
      let(:description) { nil }

      it 'shows proper errors' do
        is_expected.to have_inline_error(t('errors.filled?')).for_field(t(:name))
        is_expected.to have_inline_error(t('errors.filled?')).for_field(t(:middle_name))
        is_expected.to have_inline_error(t('errors.filled?')).for_field(t(:surname))
        is_expected.to have_inline_error(t('errors.rules.gender.included_in?')).for_field(t(:gender))
        is_expected.to have_inline_error(t('errors.filled?')).for_field(t(:birthday))
        is_expected.to have_inline_error(t('errors.filled?')).for_field(t(:description))
      end
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
