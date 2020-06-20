require "application_system_test_case"

class SentMessagesTest < ApplicationSystemTestCase
  setup do
    @sent_message = sent_messages(:one)
  end

  test "visiting the index" do
    visit sent_messages_url
    assert_selector "h1", text: "Sent Messages"
  end

  test "creating a Sent message" do
    visit sent_messages_url
    click_on "New Sent Message"

    click_on "Create Sent message"

    assert_text "Sent message was successfully created"
    click_on "Back"
  end

  test "updating a Sent message" do
    visit sent_messages_url
    click_on "Edit", match: :first

    click_on "Update Sent message"

    assert_text "Sent message was successfully updated"
    click_on "Back"
  end

  test "destroying a Sent message" do
    visit sent_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sent message was successfully destroyed"
  end
end
