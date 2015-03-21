class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :weight, :string
    add_column :products, :diameter, :string
    add_column :products, :other, :string
  end
end
