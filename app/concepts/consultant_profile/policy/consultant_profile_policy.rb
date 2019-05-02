# frozen_string_literal: true

class ConsultantProfilePolicy
  def initialize(user, model)
    @user = user
    @model = model
  end

  def present?
    @user.present? && @user.consultant?
  end
end
