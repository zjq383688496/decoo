class CreateInStockItems < ActiveRecord::Migration
  def change
    create_table :in_stock_items do |t|
      t.integer :in_stock_id
      t.integer :product_id
      t.integer :color_id
      t.decimal :weight
      t.integer :quantity
      t.timestamps
    end
  end
end
