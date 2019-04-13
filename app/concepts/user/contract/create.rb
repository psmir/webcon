# frozen_string_literal: true

module User::Contract
  class Create < Reform::Form
    property :email
    property :role
    property :password
    property :password_confirmation, virtual: true

    validation :default do
      required(:email).filled(format?: URI::MailTo::EMAIL_REGEXP)
      required(:password).filled(min_size?: 8).confirmation
      required(:role).value(included_in?: %w[client consultant])
    end

    validation :email_unique, if: :default, with: { form: true } do
      configure do
        def unique?
          User.find_by(email: form.email, role: form.role).nil?
        end
      end

      required(:email, &:unique?)
    end

    def to_key
      @model.id
    end

    def persisted?
      @model.persisted?
    end
  end
end
