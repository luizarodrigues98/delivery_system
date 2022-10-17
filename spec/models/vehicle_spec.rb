require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'valid?' do          
    it 'falso quando plate é nulo' do
      transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
      vehicle = Vehicle.new(plate: '', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
      
      expect(vehicle).to_not be_valid
    end
    it 'falso quando brand é nulo' do
      transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
      vehicle = Vehicle.new(plate: 'ZZZ-987', brand:'', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
      
      expect(vehicle).to_not be_valid
    end
    it 'falso quando model é nulo' do
      transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
      vehicle = Vehicle.new(plate: 'ZZZ-987', brand:'Chevrolet', model: '', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
      
      expect(vehicle).to_not be_valid
    end
    it 'falso quando transport_type é nulo' do
      vehicle = Vehicle.new(plate: 'ZZZ-987', brand:'', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015)
      
      expect(vehicle).to_not be_valid
    end
  end
end
