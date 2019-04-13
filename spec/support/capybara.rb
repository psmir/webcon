# frozen_string_literal: true

require 'capybara/rspec'
require 'capybara/email/rspec'

Capybara.javascript_driver = :webkit
Capybara.server = :webrick
Capybara.server_port = 3100
Capybara::Webkit.configure do |config|
  config.block_unknown_urls
  config.raise_javascript_errors = true
end