class CreateOrders < ActiveRecord::Migration
  def change    
    create_table :orders do |t|
      t.belongs_to :account, index:true
      t.datetime :order_date
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
