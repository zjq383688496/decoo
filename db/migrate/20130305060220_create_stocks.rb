class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :bh
      t.string :name
      t.string :color
      t.integer :color_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
