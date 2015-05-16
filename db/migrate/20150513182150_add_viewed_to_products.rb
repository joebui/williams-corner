class AddViewedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :viewed, :integer, default: 0
  end
end
