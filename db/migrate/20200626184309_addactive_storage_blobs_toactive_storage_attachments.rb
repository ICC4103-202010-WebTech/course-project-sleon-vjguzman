class AddActiveStorageBlobsToActiveStorageAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :active_storage_blobs, :blob_id, :integer
  end
end
