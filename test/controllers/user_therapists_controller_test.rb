require 'test_helper'

class UserTherapistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_therapists_new_url
    assert_response :success
  end

  test "should get index" do
    get user_therapists_index_url
    assert_response :success
  end

end
