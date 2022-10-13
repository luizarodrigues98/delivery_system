require 'rails_helper'

describe "Usuário edita uma Ordem de Serviço" do


  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José', status: 0,
      recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, arrival_time:24, total_value: 20, delivered_at: '2022-10-10', transport_type: transport_type, vehicle: vehicle)
    #act
    login_as(user)
    visit root_path
    click_on 'Ordem de Serviço'
    click_on 'Ver Todas'
    click_on 'rua cruzeiro do sul, 714'
    click_on 'Editar'
    fill_in "Distância Total",	with: 40 
    click_on 'Enviar'
    #assert
    expect(page).to have_content('Distância Total: 40Km')
    expect(page).to have_content('Status: Pendente')
  end
end