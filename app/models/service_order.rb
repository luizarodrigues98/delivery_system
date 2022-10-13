class ServiceOrder < ApplicationRecord
  belongs_to :transport_type
  belongs_to :vehicle
  before_validation :generate_tracking_code, on: :create
  
  validates :address, presence: true
  validates :dimensions, presence: true
  validates :weight, presence: true
  validates :recipient, presence: true
  validates :recipient_address, presence: true
  validates :total_distance, presence: true
  validates :arrival_time, presence: true
  validates :total_value, presence: true
    

  def currency
    self.total_value / 100.0
  end
  
  private
  def generate_tracking_code
   self.tracking_code = SecureRandom.alphanumeric(15).upcase 
  end
end
