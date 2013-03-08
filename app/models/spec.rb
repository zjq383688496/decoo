class Spec < ActiveRecord::Base
  attr_accessible :bh, :color_id, :product_id, :material,:name

  belongs_to :product
end
