require 'rails_helper'

RSpec.describe ServiceOrder, type: :model do
  describe '#valid?' do

    it 'deve ter um código' do
      service = ServiceOrder.new(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José',
        recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, status: 0) 
      result = service.valid?
      
      expect(result).to be true 
    end
  end

  describe 'Gera um código aleatório' do

    it 'ao criar uma nova ordem de serviço' do
      service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José',
        recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, status: 0) 
      result = service.tracking_code
      
      expect(result).not_to be_empty  
      expect(result.length).to eq 15
    end

    it 'e o código é único' do
      other_service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José',
        recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, status: 0) 
      service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José',
        recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, status: 0) 
      
      result = service.tracking_code
      expect(other_service.tracking_code).not_to eq result  
    end
      
    it 'e não deve ser modificado' do
      service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José',
        recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, status: 0) 
      original_code = service.tracking_code
      service.update(recipient_address: 'rua padre guerra, 555')

      expect(service.tracking_code).to eq original_code
    end
  end

end
