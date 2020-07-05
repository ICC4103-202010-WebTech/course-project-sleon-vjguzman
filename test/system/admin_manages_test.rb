require "application_system_test_case"

class AdminManagesTest < ApplicationSystemTestCase
  setup do
    @admin_manage = admin_manages(:one)
  end

  test "visiting the index" do
    visit admin_manages_url
    assert_selector "h1", text: "Admin Manages"
  end

  test "creating a Admin manage" do
    visit admin_manages_url
    click_on "New Admin Manage"

    click_on "Create Admin manage"

    assert_text "Admin manage was successfully created"
    click_on "Back"
  end

  test "updating a Admin manage" do
    visit admin_manages_url
    click_on "Edit", match: :first

    click_on "Update Admin manage"

    assert_text "Admin manage was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin manage" do
    visit admin_manages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin manage was successfully destroyed"
  end
end
