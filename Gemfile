source 'http://rubygems.org'

gem 'rails', '3.1.10'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

#######

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

gem 'devise'
gem 'haml'
gem 'haml-rails'
gem 'rails3-generators'
gem 'inherited_resources'

group :test, :development do
  gem "rspec-rails", "~> 2.6"
  gem "ZenTest"
  gem 'spork', '~> 0.9.0.rc'  # https://github.com/timcharper/spork
  gem 'factory_girl_rails'    # allow in dev for easy object making from console
end

group :test do
  gem 'rspec'
  gem "shoulda-matchers"   # https://github.com/thoughtbot/shoulda-matchers
end
