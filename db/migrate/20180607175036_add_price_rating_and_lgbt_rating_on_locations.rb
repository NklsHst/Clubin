class CreatePriceRatingAndLgbtRatingOnLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :price_rating, :string
    add_column :locations, :LGBT_rating, :string
  end
end
