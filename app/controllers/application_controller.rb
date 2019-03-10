class ApplicationController < ActionController::Base
  include Oath::ControllerHelpers

  before_action :require_login
end
