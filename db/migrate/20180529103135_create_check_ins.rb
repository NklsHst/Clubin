class CreateCheckIns < ActiveRecord::Migration[5.2]
  def change
    create_table :check_ins do |t|

      t.float :longitude
      t.float :latitude
      t.text :address
      t.integer :atmosphere_rating
      t.integer :queue_rating
      t.references :location, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
