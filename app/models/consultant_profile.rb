# frozen_string_literal: true

class ConsultantProfile < ApplicationRecord
  belongs_to :user, inverse_of: :consultant_profile
  has_one_attached :photo
end
