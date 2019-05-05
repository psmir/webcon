# frozen_string_literal: true

module ConsultantCardComponent
  extend ComponentHelper

  property :cp, required: true

  def title
    return full_name unless @cp.birthday.present?

    [full_name, t(:age, count: age(@cp.birthday))].join(', ')
  end

  def full_name
    [@cp.name, @cp.middle_name, @cp.surname].join(' ')
  end
end
