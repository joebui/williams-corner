require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "save without name" do
    account = Account.new
    assert_not account.save, "Saved the article without a title"
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    some_undefined_variable
    assert true
  end
end
