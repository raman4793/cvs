class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :token, unique: true
      t.references :business, foreign_key: true
      t.float :amount
      t.string :status

      t.timestamps
    end
  end
end
