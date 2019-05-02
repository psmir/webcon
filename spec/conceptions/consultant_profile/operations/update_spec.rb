# frozen_string_literal: true

require 'rails_helper'

describe ConsultantProfile::Update do
  let!(:user) { create_user role: 'consultant' }
  let(:description) { Faker::Lorem.paragraph_by_chars(100, false) }

  let!(:result) do
    ConsultantProfile::Update.call(
      params: {
        consultant_profile: {
          description: description
        }
      },
      current_user: user
    )
  end

  it 'updates Consultant Profile' do
    expect(result).to be_success
    expect(user.consultant_profile.description).to eq description
  end

  context 'no description' do
    let(:description) { nil }

    it 'does not update Consultant Profile' do
      expect(result).to be_failure
      expect(result['contract.default'].errors[:description]).to include t('errors.filled?')
    end
  end

  context 'too short description' do
    let(:description) { 'Some description' }

    it 'does not update Consultant Profile' do
      expect(result).to be_failure
      expect(result['contract.default'].errors[:description])
        .to include t('errors.min_size?', num: 100)
    end
  end

  context 'user is not a consultant' do
    let!(:user) { create_user role: 'client' }

    it 'fails the policy' do
      expect(result['result.policy.default']).to be_failure
    end
  end
end
