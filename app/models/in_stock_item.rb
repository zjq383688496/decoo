class InStockItem < ActiveRecord::Base
  attr_accessible :in_stock_id, :product_id,:color_id,:weight,:quantity
  belongs_to :in_stock
  belongs_to :product

  def weight=(total_weight)
  	self.weight=total_weight
  	self.quantity=(total_weight/product.weight).round
  end
end
