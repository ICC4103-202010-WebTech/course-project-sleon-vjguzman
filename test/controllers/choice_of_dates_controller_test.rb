require 'test_helper'

class ChoiceOfDatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @choice_of_date = choice_of_dates(:one)
  end

  test "should get index" do
    get choice_of_dates_url
    assert_response :success
  end

  test "should get new" do
    get new_choice_of_date_url
    assert_response :success
  end

  test "should create choice_of_date" do
    assert_difference('ChoiceOfDate.count') do
      post choice_of_dates_url, params: { choice_of_date: {  } }
    end

    assert_redirected_to choice_of_date_url(ChoiceOfDate.last)
  end

  test "should show choice_of_date" do
    get choice_of_date_url(@choice_of_date)
    assert_response :success
  end

  test "should get edit" do
    get edit_choice_of_date_url(@choice_of_date)
    assert_response :success
  end

  test "should update choice_of_date" do
    patch choice_of_date_url(@choice_of_date), params: { choice_of_date: {  } }
    assert_redirected_to choice_of_date_url(@choice_of_date)
  end

  test "should destroy choice_of_date" do
    assert_difference('ChoiceOfDate.count', -1) do
      delete choice_of_date_url(@choice_of_date)
    end

    assert_redirected_to choice_of_dates_url
  end
end
