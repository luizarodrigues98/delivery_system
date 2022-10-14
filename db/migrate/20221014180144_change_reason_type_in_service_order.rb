class ChangeReasonTypeInServiceOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :service_orders, :reason, :integer
    add_column :service_orders, :reason, :string
  end
end
