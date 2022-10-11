require 'rails_helper'

describe "Usuário remove uma configuração de prazo" do
  
  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    arrival_time = ArrivalTimeConfig.create!(start_distance: 0, end_distance: 10, hours: 5, transport_type_id: transport_type.id)
    #act
    login_as(user)
    visit root_path
    within 'header' do
      click_on 'Modalidade de Transporte'
    end
    click_on transport_type.name
    within 'div', id: 'prazo' do
      click_on 'Excluir'
    end
    expect(current_path).to eq transport_type_path(transport_type.id)
    expect(page).to have_content 'Prazo removido com sucesso'
    expect(page).not_to have_content '0Km - 10Km'  
  end 
  
  
end
