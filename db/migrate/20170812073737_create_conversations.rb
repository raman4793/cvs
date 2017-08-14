class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      t.string :sender_type
      t.integer :recipient_id
      t.string :recipient_type

      t.timestamps
    end
  end
end
