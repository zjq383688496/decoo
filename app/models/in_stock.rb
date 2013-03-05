class InStock < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :in_stock_items
end
