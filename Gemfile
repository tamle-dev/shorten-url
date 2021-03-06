source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'

# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails', '~> 0.3.9'
  gem 'awesome_print', '~> 1.9', '>= 1.9.2'

  # A Ruby gem to load environment variables from `.env`
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'

  # Test
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'rexml', '~> 3.2', '>= 3.2.5'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'timecop', '~> 0.9.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# DB
gem 'pg', '~> 1.2', '>= 1.2.3'

# Authentication
gem 'jwt'
gem 'devise', '~> 4.8'

# Parse json
gem 'oj', '~> 3.13', '>= 3.13.1'

# Model
gem 'enumerize', '~> 2.4'
gem 'ransack', '~> 2.4', '>= 2.4.2'

# View helpers
gem 'slim-rails', '~> 3.3'
gem 'jquery-rails', '~> 4.4'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.7'
gem 'simple_form', '~> 5.1'
gem 'nested_form_fields', '~> 0.8.4'
gem 'nested_form', '~> 0.3.2'
gem 'gretel', '~> 4.3'
gem 'kaminari', '~> 1.2', '>= 1.2.1'
gem 'bootstrap4-kaminari-views', '~> 1.0', '>= 1.0.1'

gem 'brotli', '~> 0.4.0'