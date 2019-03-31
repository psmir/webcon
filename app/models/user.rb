# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  enum role: %i[client consultant admin]
end
