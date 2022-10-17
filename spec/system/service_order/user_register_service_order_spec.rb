require 'rails_helper'

describe "Usuário cadastra uma Ordem de Serviço" do


  it 'a partir da tela inicial' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    
    login_as(user)
    visit index_path
    click_on 'Ordem de Serviço'
    click_on 'Ver Todas'
    click_on 'Cadastrar Ordem de Serviço'
  
    expect(page).to have_field('Endereço de coleta') 
    expect(page).to have_field('Dimensões')
    expect(page).to have_field('SKU')
    expect(page).to have_field('Peso')    
    expect(page).to have_field('Nome do Destinatário')
    expect(page).to have_field('Endereço do Destinatário')
    expect(page).to have_field('Distância Total')

  end

  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)

    login_as(user)
    visit index_path
    click_on 'Ordem de Serviço'
    click_on 'Ver Todas'
    click_on 'Cadastrar Ordem de Serviço'
    fill_in "Endereço de coleta",	with: "rua carvalho mota, 125" 
    fill_in "SKU",	with: "iphone-12s" 
    fill_in "Dimensões",	with: "10cm x 15cm x 20cm" 
    fill_in "Peso",	with: 2 
    fill_in "Nome do Destinatário",	with: "Maria José" 
    fill_in "Endereço do Destinatário",	with: "rua cruzeiro do sul, 714" 
    fill_in "Distância Total",	with: 20  
    click_on 'Enviar'

    expect(page).to have_content 'Ordem de serviço cadastrada com sucesso'
    expect(page).to have_content 'Endereço de coleta: rua carvalho mota, 125'
  end

  it 'com dados incompletos' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    
    login_as(user)
    visit index_path
    click_on 'Ordem de Serviços'    
    click_on 'Ver Todas'
    click_on 'Cadastrar Ordem de Serviço'
    fill_in "Endereço de coleta",	with: "" 
    fill_in "SKU",	with: "" 
    fill_in "Dimensões",	with: "10cm x 15cm x 20cm" 
    fill_in "Peso",	with: nil
    fill_in "Nome do Destinatário",	with: "Maria José" 
    fill_in "Endereço do Destinatário",	with: "rua cruzeiro do sul, 714" 
    fill_in "Distância Total",	with: nil  
    click_on 'Enviar'

    expect(page).to have_content 'Ordem de serviço não cadastrado'
    expect(page).not_to have_content 'Endereço: rua carvalho mota, 125'
  end
end
 