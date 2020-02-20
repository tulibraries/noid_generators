# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Generators", type: :feature do

  let!(:generator) { FactoryBot.create(:generator) }
  let!(:project) { FactoryBot.create(:project, generator: generator) }
  user = FactoryBot.create(:user)
  year = Time.zone.now.strftime("%Y")
  month = Time.zone.now.strftime("%m")

  session = Capybara::Session.new(:culerity)


  feature "authentication on all pages" do

    scenario "visit generators path as admin user" do
      page.set_rack_session(user_id: user.id)
      visit generators_path
      expect(page).to have_current_path("/generators")
    end
    scenario "visit generators path as non-logged-in user" do
      page.set_rack_session(user_id: nil)
      visit generators_path
      expect(page).to have_current_path("/admin")
    end
    scenario "visit generators path as non-admin logged-in user" do
      page.set_rack_session(user_id: user.id + 1)
      visit generators_path
      expect(page).to have_current_path("/admin")
    end
    scenario "visit projects page as admin user" do
      page.set_rack_session(user_id: user.id)
      visit projects_path
      expect(page).to have_current_path("/projects")
    end
    scenario "visit bulletin page as public user" do
      public_user = FactoryBot.create(:user, username: "bulletin")
      page.set_rack_session(user_id: public_user.id)
      visit projects_path
      expect(page).to have_current_path("/projects")
    end
  end

  feature "Generate Noids" do

    before(:each) do
      page.set_rack_session(user_id: user.id)
      generator.projects << project
    end
    after(:each) do
      page.set_rack_session(user_id: nil)
    end

    scenario "General Generator NOID matches format" do
      visit generator_path(generator.to_param)
      select "Manuscripts", from: "generator_projects"
      click_on "Generate NOID"
      expect(page.current_path).to eq(generator_path(generator.to_param))
      expect(page.html).to have_content("NOID: #{project.label}Z#{year}#{month}")
    end
  end

end
