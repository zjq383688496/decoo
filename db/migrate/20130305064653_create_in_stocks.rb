class CreateInStocks < ActiveRecord::Migration
  def change
    create_table :in_stocks do |t|
      t.integer :user_id	
      t.timestamps
    end
  end
end
