require 'test_helper'

class PublicControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get root_url
    assert_response :success
  end

end
