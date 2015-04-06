require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = Account.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
end
