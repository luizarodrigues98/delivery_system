require 'rails_helper'

RSpec.describe TransportType, type: :model do
  describe 'valid?' do
    context "presence" do
          
      it 'falso quando nome esta em branco' do
        transport_type = TransportType.new(name: '', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
        
        expect(transport_type).to_not be_valid
      end
      it 'por padrão status é pendente' do
        transport_type = TransportType.create(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000)
        expect(transport_type.active).to eq true
        
      end
    end
  
  end
end
