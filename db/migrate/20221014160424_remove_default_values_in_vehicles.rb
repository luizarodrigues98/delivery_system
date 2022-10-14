class RemoveDefaultValuesInVehicles < ActiveRecord::Migration[6.1]
  def change
    remove_column :vehicles, :plate, :string
    remove_column :vehicles, :brand, :string
    remove_column :vehicles, :model, :string

    add_column :vehicles, :plate, :string
    add_column :vehicles, :brand, :string
    add_column :vehicles, :model, :string
  end
end
