class CreateMailBoxes < ActiveRecord::Migration[6.0]
  def change
    create_table :mail_boxes do |t|
      t.timestamp :date
      t.string :from_message
      t.string :from_username
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
