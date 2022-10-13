require 'rails_helper'

describe "Usuário cadastra uma Ordem de Serviço" do


  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    #act
    login_as(user)
    visit root_path
    click_on 'Ordem de Serviço'
    click_on 'Ver Todas'
    click_on 'Cadastrar Ordem de Serviço'
    #assert
    expect(page).to have_field('Endereço') 
    expect(page).to have_field('Dimensões')
    expect(page).to have_field('Peso')    
    expect(page).to have_field('Remetente')
    expect(page).to have_field('Endereço do Remetente')
    expect(page).to have_field('Status')
    expect(page).to have_field('SKU')
    expect(page).to have_field('Distância Total')
    expect(page).to have_field('Tempo de Entrega')
    expect(page).to have_field('Modalidade de Transporte')
    expect(page).to have_field('Veículo')

  end

  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    
    #act
    login_as(user)
    visit root_path
    click_on 'Ordem de Serviço'
    click_on 'Ver Todas'
    click_on 'Cadastrar Ordem de Serviço'
    fill_in "Endereço",	with: "rua carvalho mota, 125" 
    fill_in "SKU",	with: "iphone-12s" 
    fill_in "Dimensões",	with: "10cm x 15cm x 20cm" 
    fill_in "Peso",	with: 2 
    fill_in "Remetente",	with: "Maria José" 
    fill_in "Endereço do Remetente",	with: "rua cruzeiro do sul, 714" 
    fill_in "Status",	with: "pendente" 
    fill_in "Distância Total",	with: 20  
    fill_in "Tempo de Entrega",	with: 24 
    fill_in "Valor Total",	with: 20
    select 'Carro' ,	from: "Modalidade de Transporte" 
    select 'XYZ-123', from: 'Veículo'
    click_on 'Enviar'

    expect(page).to have_content 'Ordem de serviço cadastrada com sucesso'
    expect(page).to have_content 'Endereço: rua carvalho mota, 125'
  end

  it 'com dados incompletos' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    
    #act
    login_as(user)
    visit root_path
    click_on 'Ordem de Serviço'
    click_on 'Ver Todas'
    click_on 'Cadastrar Ordem de Serviço'
    fill_in "Endereço",	with: "" 
    fill_in "SKU",	with: "" 
    fill_in "Dimensões",	with: "10cm x 15cm x 20cm" 
    fill_in "Peso",	with: 2 
    fill_in "Remetente",	with: "Maria José" 
    fill_in "Endereço do Remetente",	with: "rua cruzeiro do sul, 714" 
    fill_in "Status",	with: "pendente" 
    fill_in "Distância Total",	with: 20  
    fill_in "Tempo de Entrega",	with: 24 
    fill_in "Valor Total",	with: 20
    select 'Carro' ,	from: "Modalidade de Transporte" 
    select 'XYZ-123', from: 'Veículo'
    click_on 'Enviar'

    expect(page).to have_content 'Ordem de serviço não cadastrado'
    expect(page).not_to have_content 'Endereço: rua carvalho mota, 125'
  end
end
 