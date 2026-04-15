require "test_helper"

class Picop::StationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get picop_stations_index_url
    assert_response :success
  end

  test "should get show" do
    get picop_stations_show_url
    assert_response :success
  end

  test "should get new" do
    get picop_stations_new_url
    assert_response :success
  end

  test "should get edit" do
    get picop_stations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get picop_stations_destroy_url
    assert_response :success
  end
end
