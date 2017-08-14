class AddFileSizeToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :file_size, :integer, limit: 8
  end
end
