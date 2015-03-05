class AddOfferOfTheWeekToProduct < ActiveRecord::Migration
  def change
    add_column :products, :offer_of_the_week, :boolean
  end
end
