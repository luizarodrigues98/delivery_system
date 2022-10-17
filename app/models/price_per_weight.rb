class PricePerWeight < ApplicationRecord
  belongs_to :transport_type

  validates :start_weight, presence: true
  validates :end_weight, presence: true
  validates :value_per_distance, presence: true
  validates :end_weight, numericality: { only_integer: true, greater_than_or_equal_to: 1 }


  def currency
    self.value_per_distance / 100.0
  end
end