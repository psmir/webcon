class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  add_flash_types :success, :error

  helper_method :current_user
  before_action :require_login

  private

  def require_login
    redirect_to new_session_path unless current_user
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    else
      @current_user = nil
    end
  end

  def perform(operation, failures = {})
    @result = operation.call(params: params, current_user: current_user)

    if @result.failure?
      default_failures.merge(failures).each do |k, v|
        v.call(@result) if @result[k.to_s].failure?
      end
    elsif block_given?
      yield @result
    end
  end

  def default_failures
    {
      'result.policy.default': lambda { |_r|
        redirect_to root_path, alert: t(:authorization_error)
      }
    }
  end
end
