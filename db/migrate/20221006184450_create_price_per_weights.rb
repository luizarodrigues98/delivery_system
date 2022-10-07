class CreatePricePerWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :price_per_weights do |t|
      t.integer :start_weight, null: false, default: 0
      t.integer :end_weight, null: false, default: 0
      t.integer :value_per_distance, null: false, default: 0
      t.references :transport_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
