class PricePerWeight < ApplicationRecord
  belongs_to :transport_type

  validates :start_weight, presence: true
  validates :end_weight, presence: true
  validates :value_per_distance, presence: true

  def weight_list(transport_type_id)
    transport_type = TransportType.find(transport_type_id)
    prices = transport_type.price_per_weights.order(:start_weight)

    if prices.any?
      start = prices.last.end_weight + 1
      if prices.first.start_weight > 10
        list_start = (0..prices.first.start_weight).select{ |n| (n == 0 || n == prices.first.start_weight - 1) || (n <= 100 && n % 10 == 0) || (n % 100 == 0) }
        return list_start + (start..1000).select{ |n| (n == start) || (n <= 100 && n % 10 == 0) || (n % 100 == 0) }
      end
      (start..1000).select{ |n| (n == start) || (n <= 100 && n % 10 == 0) || (n % 100 == 0) }
    else
      (0..1000).select{ |n| (n == 0) || (n <= 100 && n % 10 == 0) || (n % 100 == 0) }
    end
  end

end