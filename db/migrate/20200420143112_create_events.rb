class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :description
      t.string :location
      t.timestamp :final_date
      t.timestamp :creation_date

      t.timestamps
    end
  end
end
