class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.integer :number
      t.integer :messages_count
      t.references :inboxFrom, null: false
      t.references :inboxTo, null: false

      t.timestamps
    end
    add_foreign_key :conversations, :inboxes, column: :inboxFrom_id
    add_foreign_key :conversations, :inboxes, column: :inboxTo_id
  end
end
