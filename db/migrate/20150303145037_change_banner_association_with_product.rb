class ChangeBannerAssociationWithProduct < ActiveRecord::Migration
  def change
    add_reference :products, :banner, index: true
  end
end
