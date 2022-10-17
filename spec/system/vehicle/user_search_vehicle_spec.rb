require 'rails_helper'

describe "Usuário busca por um veiculo" do
  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    #act 
    login_as(user)
    visit index_path
    #assert
    expect(page).not_to have_field('Buscar Veículo') 
    expect(page).not_to have_button('Buscar') 
  end  

  it 'e deve estar autenticado' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')

    #act 
    login_as(user)
    visit index_path
    click_on 'Veículos'
  
    expect(page).to have_field('Buscar Veículo') 
    expect(page).to have_button('Buscar') 
  end

  it 'e encontra um pedido' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    #act     
    login_as(user)
    visit index_path
    click_on 'Veículos'
    fill_in "Buscar Veículo", with: vehicle.plate
    click_on 'Buscar'
    #assert
    expect(page).to have_content "Resultados da Busca por: #{vehicle.plate}"
    expect(page).to have_content '1 Veículo encontrado'
    expect(page).to have_content "Modelo: #{vehicle.model}"  
    expect(page).to have_content vehicle.model 

  end 

  it 'e encontra múltiplos veículos' do

    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    other_vehicle = Vehicle.create!(plate: 'XYZ-124', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)

    #act     
    login_as(user)
    visit index_path
    click_on 'Veículos'
    fill_in "Buscar Veículo", with: 'XYZ'
    click_on 'Buscar'    
    expect(page).to have_content '2 Veículos encontrados'
    
  end
  
end