class TransportType < ApplicationRecord
  validates :name, presence: true
  validates :max_distance, presence: true
  validates :min_distance, presence: true
  validates :max_weight, presence: true
  validates :min_weight, presence: true
  validates :fixed_rate, presence: true
end
