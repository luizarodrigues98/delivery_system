class AddAdminDefaultValueToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :admin, :boolean, default: false
  end
end
