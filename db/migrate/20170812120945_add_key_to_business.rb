class AddKeyToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :key, :binary
  end
end
