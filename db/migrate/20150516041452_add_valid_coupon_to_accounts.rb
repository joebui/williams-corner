class AddValidCouponToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :valid_coupon, :boolean, default: false
  end
end
