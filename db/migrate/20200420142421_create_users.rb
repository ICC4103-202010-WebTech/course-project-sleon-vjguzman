class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.text :short_bio
      t.string :location
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
