require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get get_customers" do
    get :get_customers
    assert_response :success
  end

  test "should get get_customer" do
    get :get_customer
    assert_response :success
  end

  test "should get get_products" do
    get :get_products
    assert_response :success
  end

  test "should get get_product" do
    get :get_product
    assert_response :success
  end

end
