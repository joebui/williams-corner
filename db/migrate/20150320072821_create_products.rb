class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :des
      t.string :img
      t.string :genre
      t.string :price

      t.timestamps null: false
    end
  end
end
