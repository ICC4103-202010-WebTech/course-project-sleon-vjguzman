class CreateChoiceOfDates < ActiveRecord::Migration[6.0]
  def change
    create_table :choice_of_dates do |t|
      t.text :description

      t.timestamps
    end
  end
end
