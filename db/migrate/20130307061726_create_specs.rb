class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      t.string :bh
      t.string :name
      t.string :value
      t.boolean :is_color
      t.integer :color_id

      t.timestamps
    end
  end
end
