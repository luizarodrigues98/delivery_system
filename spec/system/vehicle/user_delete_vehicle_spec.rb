require 'rails_helper'

describe "Usuário remove um veículo" do
  
  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)

    #act
    login_as(user)
    visit root_path
    visit root_path
    within 'header' do
      click_on 'Veículos'
    end
    click_on 'XYZ-123'
    click_on 'Excluir'
    expect(current_path).to eq vehicles_path
    expect(page).to have_content 'Veículo removido com sucesso'
    expect(page).not_to have_content 'XYZ-123'  
  end 
  it 'e não remove as outras' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    other_vehicle = Vehicle.create!(plate: 'XYZ-145', brand:'Chevrolet', model: 'Polo', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    
    #act
    login_as(user)
    visit root_path
    within 'header' do
      click_on 'Veículos'
    end    
    click_on 'XYZ-123'
    click_on 'Excluir'
    expect(current_path).to eq vehicles_path
    expect(page).to have_content 'Veículo removido com sucesso'
    expect(page).not_to have_content 'XYZ-123'  
    expect(page).to have_content 'XYZ-145'  
  end
  
  
end
