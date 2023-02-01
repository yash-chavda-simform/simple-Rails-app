require "test_helper"

class FacultysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get facultys_index_url
    assert_response :success
  end
end
