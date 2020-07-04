require "application_system_test_case"

class ReportCommentsTest < ApplicationSystemTestCase
  setup do
    @report_comment = report_comments(:one)
  end

  test "visiting the index" do
    visit report_comments_url
    assert_selector "h1", text: "Report Comments"
  end

  test "creating a Report comment" do
    visit report_comments_url
    click_on "New Report Comment"

    click_on "Create Report comment"

    assert_text "Report comment was successfully created"
    click_on "Back"
  end

  test "updating a Report comment" do
    visit report_comments_url
    click_on "Edit", match: :first

    click_on "Update Report comment"

    assert_text "Report comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Report comment" do
    visit report_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Report comment was successfully destroyed"
  end
end
