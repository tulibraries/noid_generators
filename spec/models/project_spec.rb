# frozen_string_literal: true

require "rails_helper"

RSpec.describe Project, type: :model do

  describe "tests for generators and projects" do
    it "*has values in both fields*" do
      project = FactoryBot.create(:project, generator: FactoryBot.create(:generator))
      expect { project.save! }.not_to raise_error
    end
    it "has required fields but no generator_id" do
      # name, label, code (opt), prefix (opt), suffix (opt)
      project = FactoryBot.build(:project, generator: nil)
      expect { project.save! }.to raise_error(/Generator must exist/)
    end
  end

  describe "Generator association" do
    example "Specify Generator in a project" do
      generator = FactoryBot.create(:generator)
      project = FactoryBot.build(:project, generator:)
      expect(project.generator).to be(generator)
    end
  end

end
