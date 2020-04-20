class CreateUserAdministrations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_administrations do |t|
      t.timestamp :last_access
      t.string :user_role

      t.timestamps
    end
  end
end
