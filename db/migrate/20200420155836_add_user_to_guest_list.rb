class AddUserToGuestList < ActiveRecord::Migration[6.0]
  def change
    add_reference :guest_lists, :user, null: true, foreign_key: true
  end
end
