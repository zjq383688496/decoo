class Color < ActiveRecord::Base
  attr_accessible :bh, :name, :value

  has_many :specs
end
