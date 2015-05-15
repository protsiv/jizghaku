class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.has_attached_file :image
      t.text :description
      t.boolean :published
      t.integer :position

      t.timestamps null: false
    end
  end
end
