class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.string :name
      t.integer :position
      t.boolean :published

      t.timestamps null: false
    end
  end
end
