require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase
  
  def setup
    @order_item = order_items(:one)
  end
  
  test "should get create" do
    @order_item = order_items(:one)
    assert_response :success
  end

  test "should get update" do
    patch :update, id: @order_item.id, order_item: {:quantity => '100'}
    assert_redirected_to order_items_path, "redirect_to successful"
  end

  test "should get destroy" do
    assert_difference('OrderItem.count', -1) do
      delete :destroy, id: @order_item.id
    end
    assert_redirected_to order_items_path
  end

end
