class DropReportComments < ActiveRecord::Migration[6.0]
  def up
    drop_table :report_comments
  end

  def down
    raise ActiveRecond::IrreversibleMigration
  end
end
