require 'test_helper'

class ReserveControllerTest < ActionDispatch::IntegrationTest
  test "should get reserveDay" do
    get reserve_reserveDay_url
    assert_response :success
  end

end
