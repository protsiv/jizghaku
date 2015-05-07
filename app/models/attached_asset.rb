class AttachedAsset < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true
  has_attached_file :asset, :styles => { :large => "1920x1080", :medium => "640x400>" }

  attr_accessible :asset, :asset_file_name, :asset_file_size, :asset_updated_at, :asset_created_at
end
