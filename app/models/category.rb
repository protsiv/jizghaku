class Category < ActiveRecord::Base
  attr_accessible :name, :slug, :restaurant_id, :restaurant, :common, :position

  belongs_to :restaurant
  has_many :products

  validates_presence_of :name
  # validates_uniqueness_of :slug
  # validates_presence_of :restaurant

  before_validation :generate_url

  def generate_url
    self.slug = name.parameterize || self.slug == ''
  end

  # def validate_category
  #    if restaurant.nill
  #
  #    end
  # end

end
