require "application_system_test_case"

class ChoiceOfDatesTest < ApplicationSystemTestCase
  setup do
    @choice_of_date = choice_of_dates(:one)
  end

  test "visiting the index" do
    visit choice_of_dates_url
    assert_selector "h1", text: "Choice Of Dates"
  end

  test "creating a Choice of date" do
    visit choice_of_dates_url
    click_on "New Choice Of Date"

    click_on "Create Choice of date"

    assert_text "Choice of date was successfully created"
    click_on "Back"
  end

  test "updating a Choice of date" do
    visit choice_of_dates_url
    click_on "Edit", match: :first

    click_on "Update Choice of date"

    assert_text "Choice of date was successfully updated"
    click_on "Back"
  end

  test "destroying a Choice of date" do
    visit choice_of_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Choice of date was successfully destroyed"
  end
end
