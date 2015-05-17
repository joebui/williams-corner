class SessionsControllerTest < ActionController::TestCase
  def setup
    @account = accounts(:one)
  end
  
  test "test create session" do
    post :create,  session: {:name => "Example User", :email => "user@example.com"}
    print "Created session successfully"
  end
end