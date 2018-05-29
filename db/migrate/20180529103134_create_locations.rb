class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|

      t.float :longitude
      t.float :latitude
      t.string :name
      t.string :address
      t.text :description
      t.text :picture
      t.string :music
      t.integer :price_rating
      t.integer :LGBT_rating

      t.timestamps
    end
  end
end
