class ChangeProductWeightType < ActiveRecord::Migration
  def change
    change_column :products, :weight, :float
  end
end
