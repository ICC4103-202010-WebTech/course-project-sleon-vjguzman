class AddEventsToMultimedia < ActiveRecord::Migration[6.0]
  def change
    add_reference :multimedia, :event, null: true, foreign_key: true
  end
end
