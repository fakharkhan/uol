class Item < ActiveRecord::Base
  belongs_to :unit
  belongs_to :category
  attr_accessible :active, :name, :short_name ,:unit_id, :category_id
end
