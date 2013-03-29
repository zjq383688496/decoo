class OutstockItem < ActiveRecord::Base
  attr_accessible :outstock_id, :product_id, :spec_bh, :spec_id,:weight,:quantity

  belongs_to :outstock
  belongs_to :spec
end
