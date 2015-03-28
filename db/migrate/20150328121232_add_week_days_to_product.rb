class AddWeekDaysToProduct < ActiveRecord::Migration
  def change
    add_column :products, :d_monday, :boolean
    add_column :products, :d_tuesday, :boolean
    add_column :products, :d_wednesday, :boolean
    add_column :products, :d_thursday, :boolean
    add_column :products, :d_friday, :boolean
  end
end
