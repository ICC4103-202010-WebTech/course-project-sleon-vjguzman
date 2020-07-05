class AddNameReportsToReport < ActiveRecord::Migration[6.0]
  def change
    add_reference :reports, :name_reports, null: false, foreign_key: true
  end
end
