# frozen_string_literal: true

module ApplicationHelper
  def age(dob)
    now = Time.now.utc.to_date
    res = now.year - dob.year

    unless now.month > dob.month || (now.month == dob.month && now.day >= dob.day)
      res -= 1
    end

    res
  end
end
