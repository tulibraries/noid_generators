# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { "admin" }
    password { "random" }
  end
end
