class AddAdminToSystemAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :system_admins, :admin, :boolean
  end
end
