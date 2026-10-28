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

  context "with the Templana generator" do
    let!(:project_ttunn) { FactoryBot.create(:project, generator:, name: "Temple News", code: "", label: "TTUNN") }

    before { generator.update!(name: "Templana (Complex)") }

    def submit_templana(project, class_code)
      patch generator_path(generator), params: {
        generator: { project_id: project.id, class_code:, lock_version: generator.reload.lock_version }
      }
    end

    it "allows a blank classification code for TTUNN" do
      submit_templana(project_ttunn, "")

      expect(response).to have_http_status(:found)
      expect(flash[:notice]).to eq("NOID: TTUNNXZ#{Time.zone.now.strftime('%Y%m')}000001")
      expect(project_ttunn.reload.noid).to eq(1)
    end

    it "rejects a blank classification code for other projects without advancing the counter" do
      allow_any_instance_of(GeneratorsController).to receive(:render).with(:show, status: :unprocessable_entity) do |controller|
        controller.head :unprocessable_entity
      end

      submit_templana(project_a, " ")

      expect(response).to have_http_status(:unprocessable_entity)
      expect(project_a.reload.noid.to_i).to eq(0)
    end

    it "accepts a classification code for other projects" do
      submit_templana(project_a, "123")

      expect(response).to have_http_status(:found)
      expect(flash[:notice]).to eq("NOID: AMANUX123Z#{Time.zone.now.strftime('%Y%m')}000001")
    end
  end
end
