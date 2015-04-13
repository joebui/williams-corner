class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :product, index: true
      t.references :account, index: true
      t.string :owner
      t.integer :unit_price
      t.integer :quantity
      t.string :total_price      
      t.timestamps null: false
    end
    add_foreign_key :order_items, :products
    add_foreign_key :order_items, :accounts
  end
end
