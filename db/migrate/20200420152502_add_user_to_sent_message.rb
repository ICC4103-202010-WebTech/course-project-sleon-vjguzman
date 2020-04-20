class AddUserToSentMessage < ActiveRecord::Migration[6.0]
  def change
    add_reference :sent_messages, :user, null: true, foreign_key: true
  end
end
