class CreatePricePerDistances < ActiveRecord::Migration[6.1]
  def change
    create_table :price_per_distances do |t|
      t.integer :start_distance, default: 0
      t.integer :end_distance, default: 0
      t.integer :rate, default: 0
      t.references :transport_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
