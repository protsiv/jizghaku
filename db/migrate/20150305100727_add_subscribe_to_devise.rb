class AddSubscribeToDevise < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.boolean   :subscribe_to
    end
  end
end
