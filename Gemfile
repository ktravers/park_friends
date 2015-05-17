source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'figaro'
gem 'simple_form'
gem 'omniauth-facebook'
gem 'wunderground'
gem 'rails-erd'

group :development, :test do
  # Call 'byebug' anywhere to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console'

  # Preview email in the default browser instead of sending it
  gem 'letter_opener'

  # Spring speeds up development by keeping your app running in the background.
  # Read more: https://github.com/rails/spring
  # gem 'spring'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'cucumber'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'factory_girl_rails'
  gem 'simplecov'
  gem 'database_cleaner'
  gem 'sqlite3'
  gem 'pry'
  gem 'guard-rspec', require: false
  gem 'thin'
  gem 'codeclimate-test-reporter', require: nil
end

group :production do
  gem 'pg'
  gem 'google-analytics-rails'
  gem 'rails_12factor'
end

gem 'bootstrap-sass'
