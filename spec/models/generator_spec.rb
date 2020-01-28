# frozen_string_literal: true

require "rails_helper"

RSpec.describe Generator, type: :model do
  describe "Required attributes" do
    example "Missing name" do
      generator = FactoryBot.build(:generator, name: "")
      expect { generator.save! }.to raise_error(/Name can't be blank/)
    end
  end
end
