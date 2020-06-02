require 'test_helper'

class EventCreatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_creator = event_creators(:one)
  end

  test "should get index" do
    get event_creators_url
    assert_response :success
  end

  test "should get new" do
    get new_event_creator_url
    assert_response :success
  end

  test "should create event_creator" do
    assert_difference('EventCreator.count') do
      post event_creators_url, params: { event_creator: {  } }
    end

    assert_redirected_to event_creator_url(EventCreator.last)
  end

  test "should show event_creator" do
    get event_creator_url(@event_creator)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_creator_url(@event_creator)
    assert_response :success
  end

  test "should update event_creator" do
    patch event_creator_url(@event_creator), params: { event_creator: {  } }
    assert_redirected_to event_creator_url(@event_creator)
  end

  test "should destroy event_creator" do
    assert_difference('EventCreator.count', -1) do
      delete event_creator_url(@event_creator)
    end

    assert_redirected_to event_creators_url
  end
end
