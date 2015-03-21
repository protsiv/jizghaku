class Product < ActiveRecord::Base
  attr_accessible :name, :slug, :price, :description, :image, :category, :category_id, :banner_id, :offer_of_the_week, :position, :business_lunch, :size, :weight, :diameter, :other
  belongs_to :category
  belongs_to :banner

  has_many :line_items

  has_attached_file :image, styles:{
                               thumb: '330x290>',
                               main: '705x423#',
                               large: '1200x645#'
                           },
                    convert_options:{
                        thumb: '-quality 94 -interlace Plane',
                        main: '-quality 94 -interlace Plane',
                        large: '-quality 94 -interlace Plane'
                    },
                    default_url: "/assets/images/product/missing.jpg",
                    url:'/assets/images/product/:class/:id/image_:style.:extension',
                    path:':rails_root/public:url'

  validates_attachment :image, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml'] }

  before_validation :generate_url

  def generate_url
    self.slug = name.parameterize || self.slug == ''
  end
end
