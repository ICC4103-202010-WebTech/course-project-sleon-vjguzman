class CreateReportComments < ActiveRecord::Migration[6.0]
  def change
    create_table :report_comments do |t|
      t.text :description
      t.references :comment_id, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: true
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
