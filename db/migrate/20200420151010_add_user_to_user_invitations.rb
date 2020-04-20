class AddUserToUserInvitations < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_invitations, :user, null: true, foreign_key: true
  end
end
