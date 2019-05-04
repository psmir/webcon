# frozen_string_literal: true

module ConsultantProfile::Contract
  class Update < Reform::Form
    include Dry

    property :photo, virtual: true
    property :description

    validation do
      required(:description).filled(min_size?: 100)
    end
  end
end
