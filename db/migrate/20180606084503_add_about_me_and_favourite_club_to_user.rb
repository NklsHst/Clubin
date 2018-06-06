class AddAboutMeAndFavouriteClubToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :about_me, :string
    add_column :users, :favourite_club, :string
  end
end
