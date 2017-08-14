class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.references :upload, foreign_key: true
      t.string :status
      t.text :draft
      t.string :file_name
      t.references :user, foreign_key: true
      t.integer :nol

      t.timestamps
    end
  end
end
