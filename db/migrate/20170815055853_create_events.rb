class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :message
      t.integer :eventable_id
      t.string :eventable_type
      t.integer :initiatable_id
      t.string :initiatable_type

      t.timestamps
    end
  end
end
