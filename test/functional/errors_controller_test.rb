require 'test_helper'

class ErrorsControllerTest < ActionController::TestCase
  test "should get 404" do
    get :page_not_found
    assert_response :success
  end

  test "should get unauthorized" do
    get :unauthorized
    assert_response :success
  end

  test "should get unauthenticated" do
    get :unauthenticated
    assert_response :success
  end

end
