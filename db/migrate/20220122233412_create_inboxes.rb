class CreateInboxes < ActiveRecord::Migration[5.2]
  def change
    create_table :inboxes do |t|
      t.string :name
      t.string :conversations_count
      t.string :token, null:false, index: true

      t.timestamps
    end
  end
end
