class InStockItem < ActiveRecord::Base
  attr_accessible :in_stock_id, :product_id,:color_id,:weight,:quantity,:spec_bh,:spec_id,:memo
  belongs_to :in_stock
  belongs_to :product
  belongs_to :color
  belongs_to :spec  

  def spec_bh=(spec_bh_field)
    spec=Spec.find_by_bh(spec_bh_field)
    self.spec_id=spec.id
    self.product_id=spec.product_id
    self.color_id=spec.color_id   
  	
  end

  def spec_bh
    self.spec.bh    
  end

  before_save :save_quantity
  def save_quantity
    self.quantity=(self.weight/self.product.weight).round
  end
end
