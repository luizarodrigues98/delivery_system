class TransportType < ApplicationRecord
  has_many :price_per_weights
  has_many :price_per_distances
  has_many :arrival_time_configs
  has_many :service_orders
  has_many :vehicles

  validates :name, presence: true
  validates :max_distance, presence: true
  validates :min_distance, presence: true
  validates :max_weight, presence: true
  validates :min_weight, presence: true
  validates :fixed_rate, presence: true

  scope :active, -> { where(active: true) }
  scope :for_service_order, ->(total_distance, weight) do
    where("min_distance <= #{total_distance} AND max_distance >= #{total_distance} AND min_weight <= #{weight} AND max_weight >= #{weight}").
    select{ |t| t.vehicles.active.count > 0 }
  end

  def currency
    self.fixed_rate / 100.0
  end
end
