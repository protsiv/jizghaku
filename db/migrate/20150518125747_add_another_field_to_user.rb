class AddAnotherFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :username, :string
  end
end
