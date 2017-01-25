class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.float :price
      t.text :description
      t.has_attached_file :image
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :categories
  end
end
