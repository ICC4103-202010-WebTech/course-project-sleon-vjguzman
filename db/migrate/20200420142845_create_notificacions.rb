class CreateNotificacions < ActiveRecord::Migration[6.0]
  def change
    create_table :notificacions do |t|
      t.timestamp :received_date
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
