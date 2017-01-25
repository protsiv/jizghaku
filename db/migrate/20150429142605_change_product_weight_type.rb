class ChangeProductWeightType < ActiveRecord::Migration
  def change
    remove_column :products, :weight
    add_column :products, :weight, :float
  end
end
