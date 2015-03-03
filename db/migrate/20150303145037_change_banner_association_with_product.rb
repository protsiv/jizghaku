class ChangeBannerAssociationWithProduct < ActiveRecord::Migration
  def change
    remove_column :products, :index_banner_id
    add_column :products, :banner_id, :integer
  end
end
