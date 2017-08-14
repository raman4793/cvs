class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.string :sender_type
      t.text :message

      t.timestamps
    end
  end
end
