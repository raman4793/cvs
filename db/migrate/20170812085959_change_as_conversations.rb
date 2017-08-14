class ChangeAsConversations < ActiveRecord::Migration[5.0]
  def change
    rename_column :conversations, :sender_id, :sendable_id
    rename_column :conversations, :sender_type, :sendable_type
    rename_column :conversations, :recipient_id, :recipientable_id
    rename_column :conversations, :recipient_type, :recipientable_type

    rename_column :messages, :sender_id, :sendable_id
    rename_column :messages, :sender_type, :sendable_type
  end
end
