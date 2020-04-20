class AddEventDatesToVote < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :event_dates, null: true, foreign_key: true
  end
end
