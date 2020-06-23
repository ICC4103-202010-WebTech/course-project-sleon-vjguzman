require 'test_helper'

class MembersListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @members_list = members_lists(:one)
  end

  test "should get index" do
    get members_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_members_list_url
    assert_response :success
  end

  test "should create members_list" do
    assert_difference('MembersList.count') do
      post members_lists_url, params: { members_list: {  } }
    end

    assert_redirected_to members_list_url(MembersList.last)
  end

  test "should show members_list" do
    get members_list_url(@members_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_members_list_url(@members_list)
    assert_response :success
  end

  test "should update members_list" do
    patch members_list_url(@members_list), params: { members_list: {  } }
    assert_redirected_to members_list_url(@members_list)
  end

  test "should destroy members_list" do
    assert_difference('MembersList.count', -1) do
      delete members_list_url(@members_list)
    end

    assert_redirected_to members_lists_url
  end
end
