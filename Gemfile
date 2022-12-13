# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 6.0"
# gem "sqlite3"
gem "puma", "~> 5.6"
gem "sass-rails", "~> 6.0"
gem "uglifier", ">= 1.3.0"
gem "pg"
gem "coffee-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.11"
gem "bootsnap", ">= 1.14.0", require: false
gem "simple_form"
gem "bootstrap", "~> 4.6"
gem "pry-rails"
gem "jquery-rails"
gem "simple_auth"
gem "bcrypt", "~> 3.1.7"
gem "warden"
gem "execjs"
gem "okcomputer"
gem "net-http"
gem "net-smtp"
gem "net-imap"
gem "net-pop"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "json-schema"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rack_session_access"
end

group :development do
  gem "brakeman"
  gem "faker"
  gem "populate"
  gem "rails-erd"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
  gem "sequel"
end

group :test do
  gem "capybara", "~> 3"
  gem "webdrivers"
  gem "factory_bot_rails"
  gem "guard-rspec", require: false
  gem "mutant-rspec"
  gem "rails-controller-testing"
  gem "rspec-activemodel-mocks"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "simplecov", require: false
  gem "webmock"
  gem "launchy"
  gem "rack-test", require: "rack/test"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
