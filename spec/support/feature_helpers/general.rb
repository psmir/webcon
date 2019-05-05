# frozen_string_literal: true

module FeatureHelpers
  module General
    def set_date_for(selector, date)
      page.execute_script("$my_fp = flatpickr('#{selector}'); $my_fp.setDate('#{date.to_s}')");
    end
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers::General, type: :feature
end
