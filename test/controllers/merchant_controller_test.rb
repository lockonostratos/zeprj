require 'test_helper'

class MerchantControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
