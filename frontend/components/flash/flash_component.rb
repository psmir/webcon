# frozen_string_literal: true

module FlashComponent
  extend ComponentHelper
  RAILS_BOOTSTRAP = {
    'success' => 'alert-success',
    'error' => 'alert-danger',
    'alert' => 'alert-warning',
    'notice' => 'alert-info'
  }.freeze

  property :flash_messages, required: true

  def bootstrap_class_for(flash_type)
    RAILS_BOOTSTRAP[flash_type]
  end
end
