require 'test_helper'

class AuPsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aup = aups(:one)
  end

  test "should get index" do
    get aups_url
    assert_response :success
  end

  test "should get new" do
    get new_aup_url
    assert_response :success
  end

  test "should create aup" do
    assert_difference('Aup.count') do
      post aups_url, params: { aup: {  } }
    end

    assert_redirected_to aup_url(Aup.last)
  end

  test "should show aup" do
    get aup_url(@aup)
    assert_response :success
  end

  test "should get edit" do
    get edit_aup_url(@aup)
    assert_response :success
  end

  test "should update aup" do
    patch aup_url(@aup), params: { aup: {  } }
    assert_redirected_to aup_url(@aup)
  end

  test "should destroy aup" do
    assert_difference('Aup.count', -1) do
      delete aup_url(@aup)
    end

    assert_redirected_to aups_url
  end
end
