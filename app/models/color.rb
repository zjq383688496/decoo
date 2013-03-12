class Color < ActiveRecord::Base
  attr_accessible :bh, :name, :value,:memo

  has_many :specs

  validates :bh,:presence => true, :uniqueness => true
end
