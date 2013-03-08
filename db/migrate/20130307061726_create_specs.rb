class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.integer :product_id
      t.string :bh
      t.string :name
      t.integer :color_id
      t.string :material
      t.integer :quantity
      t.timestamps
    end
  end
end
