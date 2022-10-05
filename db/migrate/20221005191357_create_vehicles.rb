class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :plate, null: false, default: 'xxx-000'
      t.string :brand, null: false, default: 'Toyota'
      t.string :model, null: false, default: 'Etios'
      t.integer :status, null: false, default: 0
      t.integer :max_weight, null: false, default: 0
      t.integer :fabrication_year, null: false, default: 0
      t.references :transport_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
