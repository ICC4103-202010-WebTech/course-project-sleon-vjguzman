require "application_system_test_case"

class EventCreatorsTest < ApplicationSystemTestCase
  setup do
    @event_creator = event_creators(:one)
  end

  test "visiting the index" do
    visit event_creators_url
    assert_selector "h1", text: "Event Creators"
  end

  test "creating a Event creator" do
    visit event_creators_url
    click_on "New Event Creator"

    click_on "Create Event creator"

    assert_text "Event creator was successfully created"
    click_on "Back"
  end

  test "updating a Event creator" do
    visit event_creators_url
    click_on "Edit", match: :first

    click_on "Update Event creator"

    assert_text "Event creator was successfully updated"
    click_on "Back"
  end

  test "destroying a Event creator" do
    visit event_creators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event creator was successfully destroyed"
  end
end
