require 'test_helper'

class DraftContestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get draft_contests_index_url
    assert_response :success
  end

  test "should get new" do
    get draft_contests_new_url
    assert_response :success
  end

  test "should get show" do
    get draft_contests_show_url
    assert_response :success
  end

end
