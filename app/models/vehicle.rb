class Vehicle < ApplicationRecord
  validates :plate, presence: true
  validates :brand, presence: true
  validates :model, presence: true
  validates :fabrication_year, presence: true
  validates :max_weight, presence: true
  
  belongs_to :transport_type

  enum status: { active: 0, allocated: 1, maintenance: 2}

end
