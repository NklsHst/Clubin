class RemoveFacebookUid < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :facebook_uid
  end
end
