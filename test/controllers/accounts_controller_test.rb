require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  def setup
    @account = accounts(:one)
  end

  test "should get create" do
    post :create , account: {:name => "Example User", :email => "user@example.com", :password => "password", :password_confirmation => "password"}
    assert_redirected_to "http://test.host/", "redirect_to successful"
  end

  test "should get destroy" do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account.id
    end
    assert_redirected_to accounts_path
  end

  test "should not get index" do
    get :index
    assert_response :success, "Only admin can access this page"
  end

  
end
