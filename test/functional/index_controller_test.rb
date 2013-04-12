require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get index,search" do
    get :index,search
    assert_response :success
  end

end
