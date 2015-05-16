class AddColumn < ActiveRecord::Migration
  def change
    add_column :accounts, :language, :string, default: 'en'
    add_column :order_items, :discount, :float
    add_column :order_items, :hide, :boolean, default: false
    add_column :order_items, :tran_date, :date, default: Date.today

    create_table :coupons do |t|
      t.string :code
      t.string :date

      t.timestamps null: false
    end
  end
end
