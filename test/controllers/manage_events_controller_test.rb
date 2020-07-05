require 'test_helper'

class ManageEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manage_event = manage_events(:one)
  end

  test "should get index" do
    get manage_events_url
    assert_response :success
  end

  test "should get new" do
    get new_manage_event_url
    assert_response :success
  end

  test "should create manage_event" do
    assert_difference('ManageEvent.count') do
      post manage_events_url, params: { manage_event: {  } }
    end

    assert_redirected_to manage_event_url(ManageEvent.last)
  end

  test "should show manage_event" do
    get manage_event_url(@manage_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_manage_event_url(@manage_event)
    assert_response :success
  end

  test "should update manage_event" do
    patch manage_event_url(@manage_event), params: { manage_event: {  } }
    assert_redirected_to manage_event_url(@manage_event)
  end

  test "should destroy manage_event" do
    assert_difference('ManageEvent.count', -1) do
      delete manage_event_url(@manage_event)
    end

    assert_redirected_to manage_events_url
  end
end
