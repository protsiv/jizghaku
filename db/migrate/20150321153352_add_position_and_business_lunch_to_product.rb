class AddPositionAndBusinessLunchToProduct < ActiveRecord::Migration
  def change
    add_column :products, :position, :integer
    add_column :products, :business_lunch, :boolean
    add_column :products, :size, :string
  end
end
