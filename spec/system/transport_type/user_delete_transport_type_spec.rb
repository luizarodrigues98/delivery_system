require 'rails_helper'

describe "Usuário remove uma modalidade de transporte" do
  
  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)

    #act
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Excluir'
    expect(current_path).to eq transport_types_path
    expect(page).to have_content 'Modalidade de Transporte removido com sucesso'
    expect(page).not_to have_content 'Carro'  
  end 
  
  it 'e não remove as outras' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    
    other_transport_type = TransportType.create!(name: 'Moto', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    #act
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Excluir'
    expect(current_path).to eq transport_types_path
    expect(page).to have_content 'Modalidade de Transporte removido com sucesso'
    expect(page).not_to have_content 'Carro'  
  end
  
end
