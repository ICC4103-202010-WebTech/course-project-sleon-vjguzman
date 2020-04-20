class AddUserToUserAdministration < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_administrations, :user, null: true, foreign_key: true
  end
end
