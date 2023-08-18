require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one) # Assuming you have fixtures or factories set up
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end
end