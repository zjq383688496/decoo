class Outstock < ActiveRecord::Base
  attr_accessible :memo, :taker, :user_id

  has_many :outstock_items
end
