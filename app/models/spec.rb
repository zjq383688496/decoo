class Spec < ActiveRecord::Base
  attr_accessible :bh, :color_id, :product_id, :material,:name

  belongs_to :product
  belongs_to :color

#  def material=(material_array)
#    self.material=material_array.join(",")
#  end
end
