class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :name
      t.float :amount
      t.integer :period
      t.integer :number_of_lines
      t.integer :number_of_files
      t.integer :size_of_files
      t.integer :number_of_users

      t.timestamps
    end
  end
end
