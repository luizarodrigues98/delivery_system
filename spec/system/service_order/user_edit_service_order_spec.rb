require 'rails_helper'

describe "Usuário edita uma Ordem de Serviço" do


  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José', status: 0,
      recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, arrival_time: 24, delivered_at: '2022-10-10'    )
      
    #act
    login_as(user)
    visit index_path
    click_on 'Ordem de Serviço'
    click_on 'Pendentes'
    click_on service.tracking_code
    click_on 'Editar'
    fill_in "Distância Total",	with: 40 
    click_on 'Enviar'
    #assert
    expect(page).to have_content('Distância Total: 40Km')
    expect(page).to have_content('Status: Pendente')
  end

  it 'com campos incompletos' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José', status: 0,
      recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20, arrival_time: 24, delivered_at: '2022-10-10'    )
      
    #act
    login_as(user)
    visit index_path
    click_on 'Ordem de Serviço'
    click_on 'Pendentes'
    click_on service.tracking_code
    click_on 'Editar'
    fill_in "Distância Total",	with: nil
    fill_in "Peso",	with: nil
    click_on 'Enviar'
    #assert
    expect(page).to have_content('Não foi possível atualizar')
    expect(current_path).to eq service_order_path(service.id)
  end
end
