class AddPrivacyToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :privacy, null: true, foreign_key: true
  end
end
