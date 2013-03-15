# encoding: utf-8
class Spec < ActiveRecord::Base
  attr_accessible :bh, :color_id, :product_id, :material,:name,:color_bh,:memo

  validates :bh,:color_id,:product_id,:presence=>true

  belongs_to :product
  belongs_to :color

  #颜色编号验证有问题，需要进一步处理
  def color_bh=(color_bh_field)
    self.color_id=Color.find_by_bh!(color_bh_field).id

  rescue ActiveRecord::RecordNotFound
    
    errors.add(:color_bh,"颜色编号#{color_bh_field}不存在")
  end

  def color_bh
    Color.find(self.color_id).bh
  end

  before_save :set_bh
  def set_bh
    self.bh="#{self.product.bh}-#{self.color.bh}"
  end

  

  def material_to_array
    self.material.split(/[\,]/) if self.material
  end


  
end
