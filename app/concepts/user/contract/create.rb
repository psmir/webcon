# frozen_string_literal: true

module User::Contract
  class Create < Reform::Form
    property :email
    property :role
    property :password
    property :password_confirmation, virtual: true

    validation do
      required(:email).filled(format?: URI::MailTo::EMAIL_REGEXP)
      required(:password).filled(min_size?: 12).confirmation
      required(:role).value(included_in?: %w[client1 consultant1])
    end

    def to_key
      @model.id
    end

    def persisted?
      @model.persisted?
    end

    def full_messages_for
    end
  end
end
