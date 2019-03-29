class ApplicationController < ActionController::Base
  include Oath::ControllerHelpers
  add_flash_types :success, :error

  before_action :require_login
end
