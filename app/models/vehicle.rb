class Vehicle < ApplicationRecord
  belongs_to :transport_type
  has_one :service_order
  validates :plate, presence: true
  validates :plate, uniqueness: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :fabrication_year, presence: true
  validates :max_weight, presence: true

  enum status: { active: 0, allocated: 1, maintenance: 2}

  def to_s
    "#{self.brand} #{self.model} - #{self.plate}"
  end

end
