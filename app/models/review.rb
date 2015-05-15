class Review < ActiveRecord::Base
  attr_accessible :name, :image, :description, :published, :position

  validates_presence_of :name, :message => "Поле не може бути пустим !"
  validates_presence_of :image, :message => "Виберіть зображення"
  validates_presence_of :description, :message => "Поле не може бути пустим !"

  has_many :line_items

  has_attached_file :image, styles:{
                               avatar: '300x300#'
                           },
                    convert_options:{
                        avatar: '-quality 94 -interlace Plane'
                    },
                    default_url: "/assets/images/product/missing.jpg",
                    url:'/assets/images/review/:class/:id/image_:style.:extension',
                    path:':rails_root/public:url'



  validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'avatar file type is not allowed (only jpeg/png/gif images)'
end
