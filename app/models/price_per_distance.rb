class PricePerDistance < ApplicationRecord
  belongs_to :transport_type
  validates :start_distance, presence: true
  validates :end_distance, presence: true
  validates :rate, presence: true
end
