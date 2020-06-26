class AddactiveStorageBlobsToactiveStorageAttachments < ActiveRecord::Migration[6.0]
  def change
    add_column :activeStorageBlobs, :blob_id, :integer
  end
end
