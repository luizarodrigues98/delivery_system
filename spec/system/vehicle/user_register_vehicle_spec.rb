require 'rails_helper'

describe "Usuário cadastra um veiculo" do


  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)

    #act
    visit root_path
    login_as(user)
    visit root_path
    click_on 'Veículos'
    click_on 'Cadastrar Veículo'
    #assert
    expect(page).to have_field('Placa') 
    expect(page).to have_field('Modelo')
    expect(page).to have_field('Marca')
    expect(page).to have_field('Capacidade Máxima')    
    expect(page).to have_field('Ano de Fabricação')
    expect(page).to have_field('Tipo de transporte')

  end

  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    
    #act
    visit root_path
    login_as(user)
    visit root_path
    click_on 'Veículos'
    click_on 'Cadastrar Veículo'
    fill_in "Placa",	with: "PXQ-889"
    fill_in 'Modelo',	with: 'Classic'
    fill_in 'Marca',	with: 'Chevrolet'
    fill_in 'Capacidade Máxima',	with: 100  
    fill_in 'Ano de Fabricação',	with: 2015
    select 'Carro' ,	from: "Tipo de transporte" 
    click_on 'Enviar'
    #assert
    # expect(current_path).to eq vehicle_path(@vehicle.id) 
    expect(page).to have_content 'Veículo registrado com sucesso'
    expect(page).to have_content 'PXQ-889' 
    expect(page).to have_content 'Capacidade Máxima: 100Kg'
     

  end

  it 'com dados incompletos' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    
    #act
    visit root_path
    login_as(user)
    visit root_path
    click_on 'Veículos'
    click_on 'Cadastrar Veículo'
    fill_in "Placa",	with: ""
    fill_in 'Modelo',	with: ''
    fill_in 'Marca',	with: ''
    fill_in 'Capacidade Máxima',	with: 0
    fill_in 'Ano de Fabricação',	with: 0
    select 'Carro' ,	from: "Tipo de transporte" 
    click_on 'Enviar'
    #assert
    # expect(current_path).to eq vehicle_path(@vehicle.id) 
    expect(page).to have_content 'Não foi possível registrar o veículo'

  end
end
 