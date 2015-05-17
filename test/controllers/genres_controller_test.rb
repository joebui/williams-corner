require 'test_helper'

class GenresControllerTest < ActionController::TestCase
  def setup
    @request.env['HTTP_REFERER'] = 'http://test.host/genres'
    #post :create, product: {:name => "product_test",:genre => "rpg",:des =>"description",:price => "100",:img =>"http"}
    @genre = genres(:one)
  end

  test "create genre" do
    post :create, genre: {:name => "genre_test"}
    #assert_not_nil @product, "Failed to create new product"
    assert_redirected_to genres_path, "redirect_to successful"
  end
  
  #Can not access index page when current user is not admin
  test "should not get index" do
    get :index
    assert_response :success, "Only admin can access this page"
  end
 
  
  test "should update genre" do
    patch :update, id: @genre.id, genre: {:name => "product_test_update"}
    assert_redirected_to genres_path, "redirect_to successful"
  end
 
  test "should destroy genre" do
    delete :destroy, id: @genre.id
    assert_redirected_to genres_path
  end
end
