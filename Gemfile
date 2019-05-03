source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'haml-rails', '~> 1.0.0'
gem 'turbolinks', '~> 5.2.0' # to support redirect_to
gem 'komponent', '~> 2.2.0'
gem 'bcrypt', '~> 3.1.12'
gem 'simple_form', '~> 4.1.0'
gem 'reform', '2.3.0.rc1'
gem 'dry-validation', '~> 0.13.1'
gem 'trailblazer', '~> 2.1.0.rc1'
gem 'trailblazer-rails', '~> 2.1.7'
gem 'kaminari', '~> 1.1.1'
gem 'bootstrap4-kaminari-views', '~> 1.0.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'capybara', '~> 3.16.0'
  gem 'capybara-webkit', git: "https://github.com/thoughtbot/capybara-webkit.git"
  gem 'capybara-email', '~> 3.0.1'
  gem 'byebug'
  gem 'faker', '~> 1.9.3'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
