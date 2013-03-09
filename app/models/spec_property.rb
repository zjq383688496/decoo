# encoding: utf-8
class SpecProperty < ActiveRecord::Base
   attr_accessible :name, :value,:key

   def self.material
     SpecProperty.find_by_key('material').value.split(/[\,，]/)
   end
end
