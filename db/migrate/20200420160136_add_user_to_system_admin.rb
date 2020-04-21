class AddUserToSystemAdmin < ActiveRecord::Migration[6.0]
  def change
    add_reference :system_admins, :user, null: true, foreign_key: true
  end
end