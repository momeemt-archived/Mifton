require 'test_helper'

class AnmitsuControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anmitsu_index_url
    assert_response :success
  end

end
