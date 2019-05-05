# frozen_string_literal: true

module ConsultantProfile::Contract
  class Update < Reform::Form
    include Dry

    property :photo, virtual: true
    property :remove_photo, virtual: true
    property :name
    property :middle_name
    property :surname
    property :birthday
    property :gender
    property :description

    validation do
      required(:name).filled
      required(:middle_name).filled
      required(:surname).filled
      required(:birthday).filled
      required(:gender).value(included_in?: %w[male female])
      required(:description).filled(min_size?: 100)
    end
  end
end
