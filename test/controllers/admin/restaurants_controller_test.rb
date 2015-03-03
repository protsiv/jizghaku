require 'test_helper'

class Admin::RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { about: @restaurant.about, address: @restaurant.address, logo: @restaurant.logo, main_image: @restaurant.main_image, name: @restaurant.name, phone_number: @restaurant.phone_number, position: @restaurant.position, short_description: @restaurant.short_description, slug: @restaurant.slug, time_of_work: @restaurant.time_of_work }
    end

    assert_redirected_to admin_restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant, restaurant: { about: @restaurant.about, address: @restaurant.address, logo: @restaurant.logo, main_image: @restaurant.main_image, name: @restaurant.name, phone_number: @restaurant.phone_number, position: @restaurant.position, short_description: @restaurant.short_description, slug: @restaurant.slug, time_of_work: @restaurant.time_of_work }
    assert_redirected_to admin_restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to admin_restaurants_path
  end
end
