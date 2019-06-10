require 'test_helper'

class AppControllerTest < ActionDispatch::IntegrationTest
  test "should get film" do
    get app_film_url
    assert_response :success
  end

  test "should get person" do
    get app_person_url
    assert_response :success
  end

  test "should get starship" do
    get app_starship_url
    assert_response :success
  end

  test "should get planet" do
    get app_planet_url
    assert_response :success
  end

  test "should get index" do
    get app_index_url
    assert_response :success
  end

end
