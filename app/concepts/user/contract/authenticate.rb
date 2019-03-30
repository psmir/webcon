require "reform"
require "reform/form/dry"

module User::Contract
  class Authenticate < Reform::Form
    include Dry

    property :email, virtual: true
    property :password, virtual: true

    validation do
      required(:email)
      required(:password)
    end

    # def initialize()
    #   super OpenStruct.new
    # end
  end
end