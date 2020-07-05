require 'test_helper'

class AdminManagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_manage = admin_manages(:one)
  end

  test "should get index" do
    get admin_manages_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_manage_url
    assert_response :success
  end

  test "should create admin_manage" do
    assert_difference('AdminManage.count') do
      post admin_manages_url, params: { admin_manage: {  } }
    end

    assert_redirected_to admin_manage_url(AdminManage.last)
  end

  test "should show admin_manage" do
    get admin_manage_url(@admin_manage)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_manage_url(@admin_manage)
    assert_response :success
  end

  test "should update admin_manage" do
    patch admin_manage_url(@admin_manage), params: { admin_manage: {  } }
    assert_redirected_to admin_manage_url(@admin_manage)
  end

  test "should destroy admin_manage" do
    assert_difference('AdminManage.count', -1) do
      delete admin_manage_url(@admin_manage)
    end

    assert_redirected_to admin_manages_url
  end
end
