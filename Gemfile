source 'https://rubygems.org'
# ruby-2.2.5

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'

gem 'turbolinks'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Allows control over what information is sent as a response
gem 'active_model_serializers'

# For Cross Origin Resource Sharing, in order to make cross-origin AJAX requests possible.
gem 'rack-cors'

# To protect our API from DDoS and brute force attacks
gem 'rack-attack'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'rpush'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem "rails-erd"
end

group :development, :test do
  gem "factory_girl_rails"
  gem 'ffaker'
  gem 'shoulda-matchers', '~> 3.1'
end

gem "devise"
gem 'cancancan', '~> 1.10'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "codeclimate-test-reporter", group: :test, require: true
gem 'simplecov', :require => true, :group => :test

gem 'rake'
%w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
  gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'master'
end

gem 'capistrano', '>= 3.6.1'
gem 'capistrano-rvm'
gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'capistrano3-puma'
gem 'capistrano-rails-collection'
