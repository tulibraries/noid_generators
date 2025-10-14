# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Generator project counters", type: :feature do
  let!(:user) { FactoryBot.create(:user, username: "admin") }
  let!(:generator) { FactoryBot.create(:generator, name: "General", noid: 0, last_date: nil) }
  let!(:first_project) do
    FactoryBot.create(:project, generator:, name: "Collection A", code: "A", label: "MANU")
  end
  let!(:second_project) do
    FactoryBot.create(:project, generator:, name: "Collection B", code: "D", label: "NCP")
  end

  before do
    page.set_rack_session(user_id: user.id)
  end

  after do
    page.set_rack_session(user_id: nil)
  end

  it "resets the counter per project" do
    visit generator_path(generator)

    expect(page).to have_current_path(generator_path(generator))

    within("form") do
      expect(page).to have_selector("option", text: "Collection A (AMANU)")
      expect(page).to have_selector("option", text: "Collection B (DNCP)")
      find("option", text: "Collection A (AMANU)").select_option
    end

    click_button "Generate NOID"

    timestamp = Time.zone.now.strftime("%Y%m")
    expect(page).to have_content("NOID: AMANUZ#{timestamp}000001")

    within("form") do
      find("option", text: "Collection B (DNCP)").select_option
    end

    click_button "Generate NOID"

    expect(page).to have_content("NOID: DNCPZ#{timestamp}000001")
  end
end
