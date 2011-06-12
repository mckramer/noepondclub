source 'http://rubygems.org'

gem 'rails', '3.0.4'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Database
gem 'sqlite3'
gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'mysql'

# Authorization
gem 'devise'
# gem 'omniauth'
gem 'cancan'

# Markup
gem 'haml'
gem 'haml-rails'
gem 'sass'

# External APIs
# > Social
gem 'twitter'
# > Weather
gem 'yahoo-weather'

# Model attachments
gem 'acts_as_commentable'
# gem 'paperclip', "~> 2.3" # File attachments for ActiveRecord

# Other
gem 'jquery-rails'
gem 'faker' # Forced here due to heroku needing it as production

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development do
  gem 'nifty-generators'
  gem 'heroku'
  #gem 'faker'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'webrat'
  gem 'cucumber'
  gem 'mocha'
end