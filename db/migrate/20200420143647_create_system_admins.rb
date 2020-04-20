class CreateSystemAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :system_admins do |t|

      t.timestamps
    end
  end
end
