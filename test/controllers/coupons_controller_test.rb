require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  
  def setup
    @coupon = coupons(:one)
  end

  test "should get create" do
    post :create 
    print "created coupon successfully"
    assert_redirected_to coupons_path, "redirect_to successful"
  end

  test "should get destroy" do
    assert_difference('Coupon.count', -1) do
      delete :destroy, id: @coupon.id
    end
    assert_redirected_to coupons_path
  end

  test "should not get index" do
    get :index
    assert_response :success, "Only admin can access this page"
  end

end
