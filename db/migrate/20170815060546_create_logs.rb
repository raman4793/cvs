class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :ip_address
      t.string :controller
      t.string :action
      t.integer :initiatable_id
      t.string :initiatable_type

      t.timestamps
    end
  end
end
