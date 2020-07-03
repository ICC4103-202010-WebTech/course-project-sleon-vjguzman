require "application_system_test_case"

class AupsTest < ApplicationSystemTestCase
  setup do
    @aup = aups(:one)
  end

  test "visiting the index" do
    visit aups_url
    assert_selector "h1", text: "Aups"
  end

  test "creating a Aup" do
    visit aups_url
    click_on "New Aup"

    click_on "Create Aup"

    assert_text "Aup was successfully created"
    click_on "Back"
  end

  test "updating a Aup" do
    visit aups_url
    click_on "Edit", match: :first

    click_on "Update Aup"

    assert_text "Aup was successfully updated"
    click_on "Back"
  end

  test "destroying a Aup" do
    visit aups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aup was successfully destroyed"
  end
end
