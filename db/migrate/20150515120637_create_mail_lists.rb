class CreateMailLists < ActiveRecord::Migration
  def change
    create_table :mail_lists do |t|
      t.string :call_order
      t.string :order_product

      t.timestamps null: false
    end
  end
end
