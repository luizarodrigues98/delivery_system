class ServiceOrder < ApplicationRecord
  belongs_to :transport_type, optional: true
  belongs_to :vehicle, optional: true

  before_validation :generate_tracking_code, on: :create
  
  validates :address, presence: true
  validates :dimensions, presence: true
  validates :weight, presence: true
  validates :recipient, presence: true
  validates :recipient_address, presence: true
  validates :total_distance, presence: true
    
  enum status: { pending: 0, in_delivery: 1, delivered_on_time: 2, delivered_with_delay: 3 }

  def currency
    self.total_value.nil? ? 0 : self.total_value / 100.0
  end
  
  def calculate_value(transport_type_id)
    transport_type = TransportType.find(transport_type_id)
    price_per_weight = transport_type.price_per_weights.where("start_weight <= ? AND end_weight >= ?", self.weight, self.weight).first
    price_per_distance = transport_type.price_per_distances.where("start_distance <= ? AND end_distance >= ?", self.total_distance, self.total_distance).first

    transport_type.fixed_rate + (price_per_weight.value_per_distance * self.total_distance) + price_per_distance.rate 
  end

  private
  
  def generate_tracking_code
   self.tracking_code = SecureRandom.alphanumeric(15).upcase 
  end
end
