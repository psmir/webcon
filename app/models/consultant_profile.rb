# frozen_string_literal: true

class ConsultantProfile < ApplicationRecord
  belongs_to :user, inverse_of: :consultant_profile
end
