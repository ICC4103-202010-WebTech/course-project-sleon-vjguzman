class AddUserToNotification < ActiveRecord::Migration[6.0]
  def change
    add_reference :notifications, :user, null: true, foreign_key: true
  end
end
