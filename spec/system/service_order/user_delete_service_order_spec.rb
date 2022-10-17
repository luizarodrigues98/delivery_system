require 'rails_helper'

describe "Usuário remove uma ordem de serviço" do
  
  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    
    service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José',
      recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, arrival_time:24, total_value: 20, delivered_at: '2022-10-10', transport_type: transport_type)
    #act
    login_as(user)
    visit index_path
    click_on 'Ordem de Serviços'
    click_on 'Ver Todas'
    click_on service.tracking_code
    click_on 'Excluir'
    expect(current_path).to eq service_orders_path
    expect(page).to have_content 'Ordem de serviço deletado com sucesso'
    expect(page).not_to have_content 'rua cruzeiro do sul, 714'  
  end 
  
  it 'e não exluir outras' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    
    service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José',
      recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, arrival_time:24, total_value: 20, delivered_at: '2022-10-10', transport_type: transport_type)
    other_service = ServiceOrder.create!(address:'rua mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'José',
      recipient_address: 'rua cristal', sku:'iphone-13s', total_distance: 20, arrival_time:24, total_value: 20, delivered_at: '2022-10-10', transport_type: transport_type)
    #act
    login_as(user)
    visit index_path
    click_on 'Ordem de Serviços'
    click_on 'Ver Todas'
    click_on service.tracking_code
    click_on 'Excluir'
    expect(current_path).to eq service_orders_path
    expect(page).to have_content 'Ordem de serviço deletado com sucesso'
    expect(page).not_to have_content 'rua cruzeiro do sul, 714'  
    expect(page).to have_content 'rua cristal'

  end 

end