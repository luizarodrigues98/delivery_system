class CreateArrivalTimeConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :arrival_time_configs do |t|
      t.integer :start_distance, default: 0
      t.integer :end_distance, default: 0
      t.integer :hours, default: 0
      t.references :transport_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
