require "application_system_test_case"

class GuestListsTest < ApplicationSystemTestCase
  setup do
    @guest_list = guest_lists(:one)
  end

  test "visiting the index" do
    visit guest_lists_url
    assert_selector "h1", text: "Guest Lists"
  end

  test "creating a Guest list" do
    visit guest_lists_url
    click_on "New Guest List"

    click_on "Create Guest list"

    assert_text "Guest list was successfully created"
    click_on "Back"
  end

  test "updating a Guest list" do
    visit guest_lists_url
    click_on "Edit", match: :first

    click_on "Update Guest list"

    assert_text "Guest list was successfully updated"
    click_on "Back"
  end

  test "destroying a Guest list" do
    visit guest_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guest list was successfully destroyed"
  end
end
