# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    label { "MANU" }
    code { "A" }
    prefix { "A" }
    suffix { "Z" }
    name { "Manuscripts" }
  end
end
