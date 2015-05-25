class Cart < ActiveRecord::Base
  belongs_to :user
  attr_accessible :order_number, :status, :user
  has_many :line_items, dependent: :destroy
  attr_accessible :finished_at, :user, :user_id

  def finish
    self.finished_at ||= DateTime.now
  end

  # def add_product(product_args)
  #   current_item = ordered_items.find_by(product_id: product_args[:product_id])
  #
  #   if current_item
  #     current_item.quantity += product_args[:quantity].to_i
  #     current_item.save
  #   else
  #     current_item = ordered_items.build(product_args)
  #   end
  #     current_item
  # end

  # before_validation :set_user
  #
  # def set_user
  #   self
  # end
end

