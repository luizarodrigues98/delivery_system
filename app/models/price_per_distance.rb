class PricePerDistance < ApplicationRecord
  belongs_to :transport_type
  validates :start_distance, presence: true
  validates :end_distance, presence: true
  validates :rate, presence: true
  validates :end_distance, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  def currency
    self.rate / 100.0
  end
end
