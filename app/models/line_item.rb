class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  attr_accessible :quantity, :restaurant_id, :cart_id, :product_id, :cart, :product

  def increase_quantity count
    self.quantity = self.quantity + count.to_i
  end

end
