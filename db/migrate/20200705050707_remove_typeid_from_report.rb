class RemoveTypeidFromReport < ActiveRecord::Migration[6.0]
  def change
    remove_column :reports, :type_id, :integer
  end
end
