require 'test_helper'

class DenunciationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get denunciations_create_url
    assert_response :success
  end

end
