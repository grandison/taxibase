require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  test "should get regulations" do
    get :regulations
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
