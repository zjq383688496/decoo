# encoding: utf-8
class Spec < ActiveRecord::Base
  attr_accessible :bh, :color_id, :product_id, :material,:name,:color_bh

  validates :bh,:color_id,:product_id,:presence=>true

  belongs_to :product
  belongs_to :color

  def color_bh=(color_bh_field)
    self.color_id=Color.find_by_bh!(color_bh_field).id
  rescue ActiveRecord::RecordNotFound
    
    errors.add(:color_bh,"颜色编号#{color_bh_field}不存在")
  end

  def color_bh
    Color.find(self.color_id).bh
  end
  
end
