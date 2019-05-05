require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get abducted_survivors" do
    get reports_AbductedSurvivors_url
    assert_response :success
  end

  test "should get non_abducted_survivors" do
    get reports_NonAbductedSurvivors_url
    assert_response :success
  end

end
