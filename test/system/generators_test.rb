# frozen_string_literal: true

require "application_system_test_case"

class GeneratorsTest < ApplicationSystemTestCase
  setup do
    @generator = generators(:one)
  end

  test "visiting the index" do
    visit generators_url
    assert_selector "h1", text: "Generators"
  end

  test "creating a Generator" do
    visit generators_url
    click_on "New Generator"

    fill_in "Name", with: @generator.name
    click_on "Create Generator"

    assert_text "Generator was successfully created"
    click_on "Back"
  end

  test "updating a Generator" do
    visit generators_url
    click_on "Edit", match: :first

    fill_in "Name", with: @generator.name
    click_on "Update Generator"

    assert_text "Generator was successfully updated"
    click_on "Back"
  end

  test "destroying a Generator" do
    visit generators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Generator was successfully destroyed"
  end
end
