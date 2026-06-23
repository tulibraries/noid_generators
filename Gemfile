# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "~> 8.1"
gem "bcrypt", "~> 3.1.22"
gem "bootsnap", ">= 1.14.0", require: false
gem "cgi", "~> 0.4.2"
gem "concurrent-ruby"
gem "cssbundling-rails"
gem "csv"
gem "execjs"
gem "importmap-rails"
gem "jbuilder", "~> 2.11"
gem "okcomputer"
gem "net-http"
gem "net-imap"
gem "net-pop"
gem "net-smtp"
gem "pg"
gem "puma"
gem "propshaft"
gem "simple_auth"
gem "simple_form"
gem "turbo-rails"
gem "warden"
gem "nokogiri", "~> 1.19.4"
gem "uri", ">= 1.0.4"

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
