# frozen_string_literal: true

class OperationsController < ApplicationController
  skip_before_action :require_login

  def proceed
    result = operation_name.call(params: operation_params, current_user: current_user)

    render json: { success: result.success? }.to_json
  end

  private

  def operation_name
    params[:operation_name].constantize
  end

  def operation_params
    params[:operation_params]
  end


end
