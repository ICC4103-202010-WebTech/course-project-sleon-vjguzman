require "application_system_test_case"

class ManageEventsTest < ApplicationSystemTestCase
  setup do
    @manage_event = manage_events(:one)
  end

  test "visiting the index" do
    visit manage_events_url
    assert_selector "h1", text: "Manage Events"
  end

  test "creating a Manage event" do
    visit manage_events_url
    click_on "New Manage Event"

    click_on "Create Manage event"

    assert_text "Manage event was successfully created"
    click_on "Back"
  end

  test "updating a Manage event" do
    visit manage_events_url
    click_on "Edit", match: :first

    click_on "Update Manage event"

    assert_text "Manage event was successfully updated"
    click_on "Back"
  end

  test "destroying a Manage event" do
    visit manage_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Manage event was successfully destroyed"
  end
end
