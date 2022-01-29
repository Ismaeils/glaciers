class RemoveInboxTo < ActiveRecord::Migration[5.2]
  def change
    remove_column :conversations, :inboxTo_id
  end
end
