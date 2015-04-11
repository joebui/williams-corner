class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.belongs_to :product, index:true
      t.string :account_name
      t.string :stars
      t.text :comment

      t.timestamps null: false
    end
  end
end
