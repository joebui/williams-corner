require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  puts "Create example account with name: 'Example user', email: 'user@example.com', password: 'example', password_confirmation: 'example'"
  
  def setup
    @account = Account.new(name: "Example User", email: "user@example.com", password: "example", password_confirmation: "example")
  end
  
  puts "First test, validation test, no change."
  test "validation test" do
    assert @account.valid?, "invalid account"
  end
  
  puts "Second test, change name to null."
  test "null name" do
    @account.name = ""
    assert @account.valid?, "Test succeeded. Reason for Failure: Name is null."
  end
  
  puts "Third test, duplicate this account to test uniqueness."
  test "name should be unique" do
    duplicate_user = @account.dup
    duplicate_user.save
    assert @account.valid?, "Test succeeded. Reason for Failure: There is already an account with this name."
  end
  
  puts "Fourth test, change email to null."
  test "null email" do
    @account.email = ""
    assert @account.valid?, "Test succeeded. Reason for Failure: Email is null."
  end
  
  puts "Fifth test, email changed to format other than *@*.*  . Case 1, no @."
  test "email no @" do
    @account.email = "useryahoo.com"
    assert @account.valid?, "Test succeeded. Reason for Failure: Wrong email format " + @account.email
  end
  
  puts "Sixth test, email changed to format other than *@*.*  . Case 2, no dot."
  test "email no dot" do
    @account.email = "user@yahoocom"
    assert @account.valid?, "Test succeeded. Reason for Failure: Wrong email format " + @account.email
  end
  
  puts "Seventh test, email changed to format other than *@*.*  . Case 3, consecutive @ and dot with no other dot."
  test "consecutive @ and dot" do
    @account.email = "user@.yahoocom"
    assert @account.valid?, "Test succeeded. Reason for Failure: Wrong email format " + @account.email
  end
  
  puts "Eighth test, change password to null."
  test "password null" do
    @account.password = nil
    assert @account.valid?, "Test succeeded. Reason for Failure: Password is null."
  end
  
  puts "Ninth test, change password to fewer than 3 characters."
  test "password short" do
    @account.password = "ex"
    assert @account.valid?, "Test succeeded. Reason for Failure: Password has fewer than 3 characters. " + @account.password
  end
  
  puts "Tenth test, change password confirmation to null or different string. Since they are essentially the same, we chose: different string."
  test "no match password confirmation" do
    @account.password_confirmation = "example2"
    assert @account.valid?, "Test succeeded. Reason for Failure: Password confirmation does not match password. " + @account.password_confirmation
  end
end
