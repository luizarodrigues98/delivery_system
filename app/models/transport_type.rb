class TransportType < ApplicationRecord
  has_many :price_per_weights
  has_many :price_per_distances
  has_many :arrival_time_configs

  validates :name, presence: true
  validates :max_distance, presence: true
  validates :min_distance, presence: true
  validates :max_weight, presence: true
  validates :min_weight, presence: true
  validates :fixed_rate, presence: true

  def currency
    self.fixed_rate / 100.0
  end
end
