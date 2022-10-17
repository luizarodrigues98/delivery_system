require 'rails_helper'

describe "Usuário finaliza uma Ordem de Serviço" do
  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    price_per_weight = PricePerWeight.create!(start_weight: 0, end_weight: 20, value_per_distance: 490, transport_type_id: transport_type.id)
    price_per_distance= PricePerDistance.create!(start_distance: 0, end_distance: 30, rate: 900, transport_type_id: transport_type.id)
    arrival_time = ArrivalTimeConfig.create!(start_distance: 0, end_distance: 20, hours: 15, transport_type_id: transport_type.id)
    service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José', status: 1,
      recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, arrival_time: 15,  initiated_at: DateTime.now, total_value: 11700, 
      transport_type: transport_type, vehicle: vehicle )

    login_as(user)
    visit index_path
    click_on 'Ordem de Serviço'
    click_on 'Ativas'
    click_on service.tracking_code
    click_on 'Entregue'
    
    expect(page).to have_content 'Status da ordem de serviço: Entregue'
    expect(page).to have_content "Veículo nessa rota: #{vehicle.brand} #{vehicle.model} - #{vehicle.plate} "
  end
end