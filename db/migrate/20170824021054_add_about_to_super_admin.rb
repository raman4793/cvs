class AddAboutToSuperAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :super_admins, :about, :text
    add_column :admins, :about, :text
    add_column :users, :about, :text
    add_column :transcribers, :about, :text

    add_column :businesses, :location, :string
  end
end
