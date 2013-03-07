class CreateSpecProperties < ActiveRecord::Migration
  def change
    create_table :spec_properties do |t|

      t.timestamps
    end
  end
end
