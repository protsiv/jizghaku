class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :slug
      t.has_attached_file :logo
      t.integer :position
      t.text :about
      t.has_attached_file :main_image
      t.text :short_description
      t.string :address
      t.string :phone_number
      t.text :time_of_work
      t.text :description

      t.timestamps null: false
    end
  end
end
