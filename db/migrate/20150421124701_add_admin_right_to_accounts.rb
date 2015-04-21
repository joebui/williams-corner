class AddAdminRightToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :is_admin, :boolean
  end
end
