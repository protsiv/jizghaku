class Cart < ActiveRecord::Base
  belongs_to :user
  attr_accessible :order_number, :status, :user
  has_many :line_items

end
