class AddCardIdAnsSubscribeToUser < ActiveRecord::Migration
  def change
    add_column :users, :card, :string
    add_column :users, :subscribe, :boolean
  end
end
