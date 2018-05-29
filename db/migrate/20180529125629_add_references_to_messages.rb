class AddReferencesToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :user, foreign_key: true
    add_reference :messages, :recipient, foreign_key: { to_table: :users }
  end
end
