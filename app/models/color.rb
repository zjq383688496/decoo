class Color < ActiveRecord::Base
  attr_accessible :bh, :name, :value,:memo

  has_many :specs

  validates :bh,:presence => true, :uniqueness => true

  after_save :change_spec
  def change_spec
    self.specs.each do |spec|
      spec.save!
    end
  end
  
end
