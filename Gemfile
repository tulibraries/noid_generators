# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "~> 7.2"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.14.0", require: false
gem "bootstrap"
gem "concurrent-ruby"
gem "cssbundling-rails"
gem "execjs"
gem "jbuilder", "~> 2.11"
gem "jquery-rails"
gem "jsbundling-rails"
gem "okcomputer"
gem "net-http"
gem "net-imap"
gem "net-pop"
gem "net-smtp"
gem "pg"
gem "puma"
gem "simple_auth"
gem "simple_form"
gem "sprockets-rails"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "warden"
gem "nokogiri", "~> 1.18.9"
gem "cgi", "~> 0.4.2"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "json-schema"
  gem "pry-rails"
  gem "rack_session_access"
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
end

group :development do
  gem "brakeman"
  gem "faker"
  gem "populate"
  gem "rails-erd"
  gem "sequel"
  gem "spring", "3.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", "~> 3"
  gem "factory_bot_rails"
  gem "guard-rspec", require: false
  gem "launchy"
  gem "mutant-rspec"
  gem "rack-test", require: "rack/test"
  gem "rails-controller-testing"
  gem "rspec-activemodel-mocks"
  gem "rspec-rails"
  gem "selenium-webdriver"
  gem "simplecov", require: false
  gem "webdrivers"
  gem "webmock"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
