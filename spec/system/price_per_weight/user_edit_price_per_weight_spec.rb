require 'rails_helper'

describe "Usuário edita uma configuração de preço por peso" do


  it 'a partir da página de detalhes' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    price_per_weight = PricePerWeight.create!(start_weight: 0, end_weight: 30, value_per_distance: 10, transport_type_id: transport_type.id)
    #act
    login_as(user)
    visit root_path
    within 'header' do
      click_on 'Modalidade de Transporte'
    end
    click_on transport_type.name
    within 'table' do
      click_on 'Editar'
    end
    #assert
    expect(page).to have_content('Editar Configuração Preço por Peso') 
    expect(page).to have_field('Peso Final')
    expect(page).to have_field('Taxa')


  end
  
  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    
    #act
    login_as(user)
    visit root_path
    visit root_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Cadastrar Preço por Peso'
    fill_in "Peso Inicial",	with: 5 
    fill_in "Peso Final",	with: 15 
    fill_in "Taxa por Km",	with: 5 
    click_on 'Enviar'
    expect(page).to have_content('Cadastrado com sucesso')
    expect(page).to have_content('5Kg - 15kg')

  end
  
  it "e mantém os campos obrigatórios" do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)

    login_as(user)
    visit root_path
    visit root_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Cadastrar Preço por Peso'
    fill_in "Peso Inicial",	with: nil
    fill_in "Peso Final",	with: nil 
    fill_in "Taxa por Km",	with: 5 
    click_on 'Enviar'
    expect(page).to have_content 'Peso Final não pode ficar em branco' 
    expect(page).to have_content('Peso Inicial não pode ficar em branco')
  end
  
end
 