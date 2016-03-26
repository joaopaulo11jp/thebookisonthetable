require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
  test "should get exchange_received" do
    get :exchange_received
    assert_response :success
  end

  test "should get exchange_sent" do
    get :exchange_sent
    assert_response :success
  end

end
