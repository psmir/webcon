# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  enum role: %i[client consultant admin]

  has_one :consultant_profile, inverse_of: :user, dependent: :destroy
end
