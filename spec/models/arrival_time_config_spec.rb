require 'rails_helper'

RSpec.describe ArrivalTimeConfig, type: :model do

  describe 'valid?' do          
    it 'falso quando transport_type é vazio' do
      arrival_time = ArrivalTimeConfig.new(start_distance: 0, end_distance: 10, hours: 5)
      
      expect(arrival_time).to_not be_valid
    end 
  end
end
