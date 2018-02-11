require 'test_helper'

class SmartHireControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get smart_hire_index_url
    assert_response :success
  end

end
