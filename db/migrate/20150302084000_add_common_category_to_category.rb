class AddCommonCategoryToCategory < ActiveRecord::Migration
  def change
    change_table :categories do |t|
      t.boolean :common
    end
  end
end
