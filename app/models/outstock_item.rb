class OutstockItem < ActiveRecord::Base
  attr_accessible :outstock_id, :product_id, :spec_bh, :spec_id

  belongs_to :outstock
end
