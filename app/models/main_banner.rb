class MainBanner < ActiveRecord::Base

  attr_accessible :name, :layer_background, :layer_1, :layer_2, :layer_3, :title, :description, :position, :published

  has_attached_file :layer_background,
                    styles: { large: "1980x700>" } ,
                    convert_options: { thumb: "-quality 94 -interlace Plane", large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/:id/image_:style.:extension",
                    path: ":rails_root/public:url"
  validates_attachment :layer_background, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml'] }

  has_attached_file :layer_1,
                    styles: { large: "1980x700>" } ,
                    convert_options: { thumb: "-quality 94 -interlace Plane", large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/layer_1/:id/image_:style.:extension",
                    path: ":rails_root/public:url"
  validates_attachment :layer_background, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml'] }

  has_attached_file :layer_2,
                    styles: { large: "1980x700>" } ,
                    convert_options: { thumb: "-quality 94 -interlace Plane", large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/layer_2/:id/image_:style.:extension",
                    path: ":rails_root/public:url"
  validates_attachment :layer_background, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml'] }

  has_attached_file :layer_3,
                    styles: { large: "1980x700>" } ,
                    convert_options: { thumb: "-quality 94 -interlace Plane", large: "-quality 94 -interlace Plane" },
                    url: "/assets/images/:class/layer_3/:id/image_:style.:extension",
                    path: ":rails_root/public:url"
  validates_attachment :layer_background, content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml'] }

  def layer_styles
    { large: "1980x700>" }
  end
  def layer_convert_options
    { thumb: "-quality 94 -interlace Plane", large: "-quality 94 -interlace Plane" }
  end
  def layer_url
    "/assets/images/:class/:id/image_:style.:extension"
  end
  def layer_path
    ":rails_root/public:url"
  end
  def layer_content_types
    { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif', 'image/svg+xml'] }
  end

end
