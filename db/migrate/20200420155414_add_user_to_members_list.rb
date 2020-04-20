class AddUserToMembersList < ActiveRecord::Migration[6.0]
  def change
    add_reference :members_lists, :user, null: true, foreign_key: true
  end
end
