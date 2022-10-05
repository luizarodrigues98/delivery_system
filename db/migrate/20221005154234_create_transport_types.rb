class CreateTransportTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :transport_types do |t|
      t.string :name, null: false
      t.integer :min_distance, null: false, default: 0
      t.integer :max_distance, null: false, default: 0
      t.integer :min_weight, null: false, default: 0
      t.integer :max_weight, null: false, default: 0
      t.integer :fixed_rate, null: false, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
