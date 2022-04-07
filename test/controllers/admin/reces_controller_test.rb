require "test_helper"

class Admin::RecesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_reces_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_reces_show_url
    assert_response :success
  end

  test "should get index" do
    get admin_reces_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_reces_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_reces_update_url
    assert_response :success
  end
end
