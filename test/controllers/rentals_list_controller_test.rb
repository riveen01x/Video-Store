require "test_helper"

class RentalsListControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get rentals_list_show_url
    assert_response :success
  end
end
