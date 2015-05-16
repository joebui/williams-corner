class AddAdminRightToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :is_admin, :boolean, default: 0
  end
end
