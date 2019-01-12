require 'test_helper'

class DisordersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get disorders_new_url
    assert_response :success
  end

  test "should get create" do
    get disorders_create_url
    assert_response :success
  end

  test "should get edit" do
    get disorders_edit_url
    assert_response :success
  end

  test "should get update" do
    get disorders_update_url
    assert_response :success
  end

  test "should get show" do
    get disorders_show_url
    assert_response :success
  end

end
