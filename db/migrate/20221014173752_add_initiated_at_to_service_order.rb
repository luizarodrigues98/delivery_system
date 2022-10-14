class AddInitiatedAtToServiceOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :service_orders, :initiated_at, :datetime
  end
end
