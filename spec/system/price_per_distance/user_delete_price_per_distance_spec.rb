require 'rails_helper'

describe "Usuário remove uma configuração de preço por distancia" do
  
  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    price_per_distance= PricePerDistance.create!(start_distance: 0, end_distance: 30, rate: 9, transport_type_id: transport_type.id)
    #act
    login_as(user)
    visit index_path
    within 'header' do
      click_on 'Modalidade de Transporte'
    end
    click_on transport_type.name
    within 'div', id: 'distance' do
      click_on 'Excluir'
    end
    expect(current_path).to eq transport_type_path(transport_type.id)
    expect(page).to have_content 'Intervalo removido com sucesso'
    expect(page).not_to have_content 'R$ 9,00'  
  end 
  
  
end
