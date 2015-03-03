class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.belongs_to :user, index: true
      t.integer :order_number
      t.boolean :status

      t.timestamps null: false
    end
    add_foreign_key :carts, :users
  end
end
