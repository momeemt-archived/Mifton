require 'test_helper'

class CrafesControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get crafes_about_url
    assert_response :success
  end
  
end
