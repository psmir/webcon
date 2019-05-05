# frozen_string_literal: true

class ConsultantProfile < ApplicationRecord
  belongs_to :user, inverse_of: :consultant_profile
  has_one_attached :photo

  enum gender: { not_selected: 0, male: 1, female: 2 }
end
