require "test_helper"

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get albums_search_url
    assert_response :success
  end
end
