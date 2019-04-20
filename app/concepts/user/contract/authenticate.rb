# frozen_string_literal: true

module User::Contract
  class Authenticate < Reform::Form
    include Dry

    property :email, virtual: true
    property :role, virtual: true
    property :password, virtual: true

    validation do
      required(:email)
      required(:role)
      required(:password)
    end
  end
end
