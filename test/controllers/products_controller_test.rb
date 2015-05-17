require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  
  #Create a valid product
  def setup
    #post :create, product: {:name => "product_test",:genre => "rpg",:des =>"description",:price => "100",:img =>"http"}
    @product = products(:one)
  end

  test "create product" do
    post :create, product: {:name => "product_test",:genre => "rpg",:des =>"description",:price => "100",:img =>"http"}
    #assert_not_nil @product, "Failed to create new product"
    assert_redirected_to products_path, "redirect_to successful"
  end
  
  #Can not access index page when current user is not admin
  test "should not get index" do
    get :index
    assert_response :success, "Only admin can access this page"
  end
 
  test "should update product" do
    patch :update, id: @product.id, product: {:name => "product_test_update",:genre => "rpg",:des =>"description",:price => "100",:img =>"http_update"}
    assert_redirected_to products_path, "redirect_to successful"
  end
 
  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product.id
    end
    assert_redirected_to products_path
  end

  
end
