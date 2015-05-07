class ReastaurantImage < ActiveRecord::Base
  attr_accessible :image, :title, :alt
  belongs_to :restaurant, :polymorphic => true
end
