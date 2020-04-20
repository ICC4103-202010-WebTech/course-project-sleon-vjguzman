class RenameNotificacionsToNotifications < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :notificacions, :notifications
  end
  def self.down
    rename_table :notifications, :notificacions
  end
end
