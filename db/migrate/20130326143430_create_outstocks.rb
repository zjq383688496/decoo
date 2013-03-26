class CreateOutstocks < ActiveRecord::Migration
  def change
    create_table :outstocks do |t|
      t.integer :user_id
      t.text :memo
      t.string :taker

      t.timestamps
    end
  end
end
