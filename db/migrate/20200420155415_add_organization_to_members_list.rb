class AddOrganizationToMembersList < ActiveRecord::Migration[6.0]
  def change
    add_reference :members_lists, :organization, null: true, foreign_key: true
  end
end
