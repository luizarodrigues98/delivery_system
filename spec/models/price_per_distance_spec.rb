require 'rails_helper'

RSpec.describe PricePerDistance, type: :model do
  describe 'valid?' do          
    it 'falso quando max_distance é zero' do
      transport_type = TransportType.create(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
      price_per_distance = PricePerDistance.create(start_distance: 0, end_distance: 0, rate: 8.9, transport_type_id: transport_type.id)
      
      expect(price_per_distance).to_not be_valid
    end 
    it 'falso quando transport_type é vazio' do
      price_per_distance = PricePerDistance.new(start_distance: 0, end_distance: 0, rate: 8.9)
      
      expect(price_per_distance).to_not be_valid
    end 
  end
end
