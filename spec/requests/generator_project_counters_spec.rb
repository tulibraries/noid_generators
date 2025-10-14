# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Generator project counters", type: :request do
  let!(:user) { FactoryBot.create(:user, username: "admin") }
  let!(:generator) { FactoryBot.create(:generator, name: "General", noid: 0, last_date: nil) }
  let!(:project_a) { FactoryBot.create(:project, generator:, name: "Collection A", code: "A", label: "MANU") }
  let!(:project_b) { FactoryBot.create(:project, generator:, name: "Collection B", code: "D", label: "NCP") }

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    allow_any_instance_of(ApplicationController).to receive(:authorized).and_return(true)
    allow_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
  end

  def generate_for(project)
    current_lock = generator.reload.lock_version

    patch generator_path(generator), params: {
      generator: {
        project_id: project.id,
        lock_version: current_lock
      }
    }

    expect(response).to have_http_status(:found)

    generator.reload
    project.reload
  end

  it "tracks counters per project independently" do
    # First NOID for project A -> 000001
    generate_for(project_a)
    expect(project_a.noid).to eq(1)

    # First NOID for project B -> 000001, project A unchanged
    generate_for(project_b)
    expect(project_b.noid).to eq(1)
    expect(project_a.reload.noid).to eq(1)

    # Second NOID for project A -> 000002
    generate_for(project_a)
    expect(project_a.noid).to eq(2)

    # Ensure generator's displayed NOID matches the latest formatting
    expect(generator.noid.to_i).to eq(2)
  end
end

