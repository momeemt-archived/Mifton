require 'test_helper'

class BectorControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get bector_top_url
    assert_response :success
  end

end
