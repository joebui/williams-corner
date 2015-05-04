class AddResetToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :reset_digest, :string
    add_column :accounts, :reset_sent_at, :datetime
  end
end
