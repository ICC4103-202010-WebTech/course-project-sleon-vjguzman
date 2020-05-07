require "application_system_test_case"

class SystemAdminsTest < ApplicationSystemTestCase
  setup do
    @system_admin = system_admins(:one)
  end

  test "visiting the index" do
    visit system_admins_url
    assert_selector "h1", text: "System Admins"
  end

  test "creating a System admin" do
    visit system_admins_url
    click_on "New System Admin"

    click_on "Create System admin"

    assert_text "System admin was successfully created"
    click_on "Back"
  end

  test "updating a System admin" do
    visit system_admins_url
    click_on "Edit", match: :first

    click_on "Update System admin"

    assert_text "System admin was successfully updated"
    click_on "Back"
  end

  test "destroying a System admin" do
    visit system_admins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "System admin was successfully destroyed"
  end
end
