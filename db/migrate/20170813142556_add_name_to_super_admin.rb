class AddNameToSuperAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :super_admins, :name, :string
  end
end
