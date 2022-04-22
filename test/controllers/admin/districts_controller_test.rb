require "test_helper"

class Admin::DistrictsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_districts_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_districts_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_districts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_districts_destroy_url
    assert_response :success
  end
end
