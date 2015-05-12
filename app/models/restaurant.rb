class Restaurant < ActiveRecord::Base
  attr_accessible :name, :slug, :content, :avatar, :short_description, :description, :about, :position, :logo, :main_image, :address, :phone_number, :time_of_work

  has_attached_file :logo,
                    url:'/assets/images/svg/:id_image_:style.:extension',
                    path:':rails_root/public:url'

  validates_attachment :logo, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml'] }

  has_attached_file :main_image,
                    styles: { thumb: "220x145>", large: "750x500#" },
                    convert_options: { thumb: "-quality 94 -interlace Plane", large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path:':rails_root/public:url'
  validates_attachment :main_image, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml'] }

  validates :name, presence: true
  # validates :slug, presence: true, uniqueness: true

  # def friendly_url
  #   self.slug = name.parameterize
  # end

  has_many :categories

  # has_many :attached_assets, :as => :attachable
  # accepts_nested_attributes_for :attached_assets, :allow_destroy => true
  #
  #
  # attr_accessible :attached_assets_attributes

  before_save :set_position
  protected
  def set_position
    self.position ||= 1 + (Restoran.where('id=?',id).maximum(:position) || 0)
  end

  # def to_param
  #   id.to_s
  # end
end


