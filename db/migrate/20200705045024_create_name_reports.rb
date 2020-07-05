class CreateNameReports < ActiveRecord::Migration[6.0]
  def change
    create_table :name_reports do |t|
      t.text :name

      t.timestamps
    end
  end
end
