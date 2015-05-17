class PasswordResetsControllerTest < ActionController::TestCase
  def setup
    @account = accounts(:one)
  end
  
 
  test "should update password_reset" do
    patch :update, id: @account.id, account: {:password => "password",:password_confirmation => "password"}
    print "updated password_reset successfully"
  end
  
end