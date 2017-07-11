class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.boolean :approved
      t.references :type, foreign_key: true
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
