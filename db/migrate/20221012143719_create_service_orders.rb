class CreateServiceOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :service_orders do |t|
      t.string :address, null: false
      t.string :sku, null: false
      t.string :dimensions, null: false
      t.integer :weight, null: false
      t.string :recipient, null: false
      t.string :recipient_address, null: false
      t.integer :status, default: 0, null: false
      t.string :tracking_code
      t.integer :total_distance, null: false
      t.integer :arrival_time
      t.integer :total_value
      t.integer :reason
      t.datetime :delivered_at
      t.references :transport_type, null: false, foreign_key: true
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
