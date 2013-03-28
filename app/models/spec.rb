# encoding: utf-8
class Spec < ActiveRecord::Base
  attr_accessible :bh, :color_id, :product_id, :material,:name,:color_bh,:memo

  validates :color_id,:product_id,:presence=>{:message=>"编号不存在"}
  validates_uniqueness_of :color_id, :scope => :product_id
  

  belongs_to :product
  belongs_to :color
  has_one :stock
  
  validate :bh_exist?
  def bh_exist?    
    unless @color_exist
      errors[:color_id]="没有这种颜色"
    end
  end
  
  #颜色编号验证有问题，需要进一步处理
  def color_bh=(color_bh_field)
    @color_exist=true
    color=Color.find_by_bh!(color_bh_field)
    self.color_id=color.id
    
  rescue ActiveRecord::RecordNotFound
    @color_exist=false
    errors[:color_bh]="颜色编号#{color_bh_field}不存在"
  end

  def color_bh
    Color.find(self.color_id).bh
  end

  before_save :set_bh
  def set_bh
    self.bh="#{self.product.bh}-#{self.color.bh}"
  end

  after_save :change_stock
  def change_stock
    self.stock.add_item if self.stock
  end

  def material_to_array
    self.material.split(/[\,]/) if self.material
  end


  
end
