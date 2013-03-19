class Stock < ActiveRecord::Base
  attr_accessible :bh, :color, :color_id, :name, :product_id, :quantity,:spec_id

  validates :spec_id,:presence => true

#  def feedin(in_stock_item)
#
#  end
  before_create :add_item
  def add_item
    spec=Spec.find(self.spec_id)
    self.bh=spec.bh
    self.color=spec.color.name
    self.color_id=spec.color.id
    self.name=spec.product.title
    self.product_id=spec.product.id
  end
end
