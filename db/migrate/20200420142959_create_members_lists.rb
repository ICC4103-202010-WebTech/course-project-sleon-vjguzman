class CreateMembersLists < ActiveRecord::Migration[6.0]
  def change
    create_table :members_lists do |t|
      t.string :user_role

      t.timestamps
    end
  end
end
