class Banner < ActiveRecord::Base
  attr_accessible :name, :position, :published
  has_many :products

  # accepts_nested_attributes_for :products
end
