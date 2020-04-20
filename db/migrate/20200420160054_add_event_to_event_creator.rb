class AddEventToEventCreator < ActiveRecord::Migration[6.0]
  def change
    add_reference :event_creators, :event, null: true, foreign_key: true
  end
end
