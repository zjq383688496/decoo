class CreateSpecProperties < ActiveRecord::Migration
  def change
    create_table :spec_properties do |t|
    	t.string :name 
    	t.text 	 :value
      t.timestamps
    end
  end
end
