class AddReferencesToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_reference :friendships, :user, foreign_key: true
    add_reference :friendships, :partner, foreign_key: { to_table: :users }
  end
end
