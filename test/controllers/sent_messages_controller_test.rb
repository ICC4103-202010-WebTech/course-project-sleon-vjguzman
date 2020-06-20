require 'test_helper'

class SentMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sent_message = sent_messages(:one)
  end

  test "should get index" do
    get sent_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_sent_message_url
    assert_response :success
  end

  test "should create sent_message" do
    assert_difference('SentMessage.count') do
      post sent_messages_url, params: { sent_message: {  } }
    end

    assert_redirected_to sent_message_url(SentMessage.last)
  end

  test "should show sent_message" do
    get sent_message_url(@sent_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_sent_message_url(@sent_message)
    assert_response :success
  end

  test "should update sent_message" do
    patch sent_message_url(@sent_message), params: { sent_message: {  } }
    assert_redirected_to sent_message_url(@sent_message)
  end

  test "should destroy sent_message" do
    assert_difference('SentMessage.count', -1) do
      delete sent_message_url(@sent_message)
    end

    assert_redirected_to sent_messages_url
  end
end
