class RemovePriceRatingAndLgbtRatingOnLocations < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :price_rating
    remove_column :locations, :LGBT_rating
  end
end
