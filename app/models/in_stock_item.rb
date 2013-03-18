class InStockItem < ActiveRecord::Base
  attr_accessible :in_stock_id, :product_id,:color_id,:weight,:quantity,:spec_bh
  belongs_to :in_stock
  belongs_to :product

  def weight=(total_weight)
  	self.weight=total_weight
  	self.quantity=(total_weight/product.weight).round
  end

  def spec_bh=(spec_bh_field)
    
    #self.product_id=Product.find()
  end
end
