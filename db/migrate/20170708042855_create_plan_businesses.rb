class CreatePlanBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :plan_businesses do |t|
      t.references :plan, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
