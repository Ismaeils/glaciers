class RenameInboxForeignKeyInConversations < ActiveRecord::Migration[5.2]
  def change
    rename_column :conversations, :inboxFrom_id, :inbox_id
  end
end
