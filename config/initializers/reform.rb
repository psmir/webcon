require "reform/form/dry"
require 'dry/validation/compat/form'

Reform::Form.class_eval do
  include Reform::Form::Dry
end
