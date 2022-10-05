class Vehicle < ApplicationRecord
  belongs_to :transport_type

  enum status: { active: 0, allocated: 1, maintenance: 2}

end
