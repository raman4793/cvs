class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.boolean :approved, default: false
      t.string :customer_token
      t.references :type, foreign_key: true
      t.references :admin, foreign_key: true
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
