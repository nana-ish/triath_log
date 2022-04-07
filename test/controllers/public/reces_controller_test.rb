require "test_helper"

class Public::RecesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_reces_show_url
    assert_response :success
  end

  test "should get index" do
    get public_reces_index_url
    assert_response :success
  end
end
