class CreateMainBanners < ActiveRecord::Migration
  def change
    create_table :main_banners do |t|
      t.string :name
      t.has_attached_file :layer_1
      t.has_attached_file :layer_2
      t.has_attached_file :layer_3
      t.has_attached_file :layer_background
      t.text :title
      t.text :description
      t.integer :position
      t.boolean :published

      t.timestamps null: false
    end
  end
end
