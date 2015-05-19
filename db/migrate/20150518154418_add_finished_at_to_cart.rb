class AddFinishedAtToCart < ActiveRecord::Migration
  def change
    add_column :carts, :finished_at, :datetime
  end
end
