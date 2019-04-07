# frozen_string_literal: true

RSpec::Matchers.define :have_inline_error do |expected|
  include Capybara::DSL

  define_method :for_field do |field|
    @field = field
    self
  end

  define_method :for_field_name do |field_name|
    @field_name = field_name
    self
  end

  define_method :container do |container|
    @container = container
    self
  end

  def options
    arr = []

    if @field
      arr += [".form-group", text: @field]
    elsif @field_name
      arr += [:xpath, ".//*[contains(@class,'form-group') and (descendant::input[@name='#{@field_name}'] or descendant::textarea[@name='#{@field_name}'])]"]
    end

    arr
  end

  match do |page|
    within(@container || 'body') do
      within(*options) do
        expect(page).to have_content(expected)
      end
    end
  end

  match_when_negated do |page|
    within(@container || 'body') do
      within(*options) do
        expect(page).to have_no_content(expected)
      end
    end
  end

  failure_message do |page|
    %Q{expected to have inline error \"#{expected}\" for field \"#{@field}\"}
  end

  failure_message_when_negated do |page|
    %Q{expected to not have inline error \"#{expected}\" for field \"#{@field}\"}
  end

  description do
    %Q{have inline error \"#{expected}\" for field \"#{@field}\"}
  end
end
