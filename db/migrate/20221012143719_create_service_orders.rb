class CreateServiceOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :service_orders do |t|
      t.string :address
      t.string :sku
      t.string :dimensions
      t.integer :weight
      t.string :recipient
      t.string :recipient_address
      t.string :status
      t.string :tracking_code
      t.integer :total_distance
      t.integer :arrival_time
      t.integer :total_value
      t.integer :reason
      t.datetime :delivered_at
      t.references :transport_type, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
