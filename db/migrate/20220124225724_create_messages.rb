class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :number
      t.string :content
      t.references :conversation, null: false

      t.timestamps
    end
    add_foreign_key :messages, :conversations, column: :conversation_id
  end
end
