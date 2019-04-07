require "reform/form/dry"
require 'dry/validation/compat/form'

Reform::Form.class_eval do
  include Reform::Form::Dry
end

# reform + simple_form
# fix 'undefined method full_messages_for'

class Reform::Contract::Result::Errors
  def full_messages_for(field_name)
    errors = @dotted_errors[field_name]
		human_field = field_name.to_s.gsub(/([\.\_])+/, " ").gsub(/(\b\w)+/) { |s| s.capitalize }
	  errors.collect { |message| "#{human_field} #{message}" }.flatten
  end
end
