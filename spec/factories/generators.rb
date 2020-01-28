# frozen_string_literal: true

FactoryBot.define do
  factory :generator do
    sequence(:name) { "General" }
    sequence(:noid) { |n| "#{ n }.to_i" }
    projects { [] }
    project { "" }
  end
end
