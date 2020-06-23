require "application_system_test_case"

class MembersListsTest < ApplicationSystemTestCase
  setup do
    @members_list = members_lists(:one)
  end

  test "visiting the index" do
    visit members_lists_url
    assert_selector "h1", text: "Members Lists"
  end

  test "creating a Members list" do
    visit members_lists_url
    click_on "New Members List"

    click_on "Create Members list"

    assert_text "Members list was successfully created"
    click_on "Back"
  end

  test "updating a Members list" do
    visit members_lists_url
    click_on "Edit", match: :first

    click_on "Update Members list"

    assert_text "Members list was successfully updated"
    click_on "Back"
  end

  test "destroying a Members list" do
    visit members_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Members list was successfully destroyed"
  end
end
