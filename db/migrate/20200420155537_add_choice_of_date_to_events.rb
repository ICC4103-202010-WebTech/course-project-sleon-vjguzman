class AddChoiceOfDateToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :choice_of_date, null: true, foreign_key: true
  end
end
