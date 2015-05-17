require 'test_helper'

class HomepageControllerTest < ActionController::TestCase
  def setup
    @product = products(:one) 
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end
  
  test "should get show" do
    get :show , id: @product.id
    assert_response :success
  end

  test "should get category" do
    get :category
    assert_response :success
  end
  
end
