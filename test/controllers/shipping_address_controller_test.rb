require "test_helper"

class ShippingAddressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shipping_address_index_url
    assert_response :success
  end

  test "should get create" do
    get shipping_address_create_url
    assert_response :success
  end

  test "should get destoy" do
    get shipping_address_destoy_url
    assert_response :success
  end

  test "should get edit" do
    get shipping_address_edit_url
    assert_response :success
  end

  test "should get update" do
    get shipping_address_update_url
    assert_response :success
  end
end