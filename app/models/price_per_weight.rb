class PricePerWeight < ApplicationRecord
  belongs_to :transport_type

  validates :start_weight, presence: true
  validates :end_weight, presence: true
  validates :value_per_distance, presence: true

end
