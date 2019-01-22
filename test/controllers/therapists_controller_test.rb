require 'test_helper'

class TherapistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get therapists_new_url
    assert_response :success
  end

  test "should get index" do
    get therapists_index_url
    assert_response :success
  end

  test "should get edit" do
    get therapists_edit_url
    assert_response :success
  end

end
