class CreateSentMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :sent_messages do |t|
      t.timestamp :date
      t.string :to_email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
