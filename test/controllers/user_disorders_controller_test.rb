require 'test_helper'

class UserDisordersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_disorders_new_url
    assert_response :success
  end

  test "should get create" do
    get user_disorders_create_url
    assert_response :success
  end

  test "should get edit" do
    get user_disorders_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_disorders_update_url
    assert_response :success
  end

  test "should get show" do
    get user_disorders_show_url
    assert_response :success
  end

end
