class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :image_url
      t.string :bh
      t.decimal :weight
      t.integer :color_id
      t.text    :memo
      t.timestamps
    end
  end
end
