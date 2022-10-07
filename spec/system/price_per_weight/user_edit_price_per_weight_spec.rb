require 'rails_helper'

describe "Usuário edita uma configuração de preço por peso" do


  it 'a partir da página de detalhes' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    
    #act
    visit root_path
    login_as(user)
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on ''
    #assert
    expect(page).to have_field('Peso inicial') 
    expect(page).to have_field('Peso final')
    expect(page).to have_field('Taxa')


  end
  
  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    
    #act
    visit root_path
    login_as(user)
    visit root_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Editar'
    fill_in "Nome",	with: "Moto"
    fill_in "Distância Máxima",	with: 15
    fill_in "Taxa fixa",	with: 500
    
    click_on 'Enviar'
    expect(page).to have_content 'com sucesso' 
    expect(page).to have_content 'Moto'
    expect(page).to have_content 'Distância Máxima: 15Km'
  end
  
  it "e mantém os campos obrigatórios" do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)

    visit root_path
    login_as(user)
    visit root_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Editar'
    fill_in "Nome",	with: ""
    fill_in "Distância Máxima",	with: ""
    fill_in "Taxa fixa",	with: ""
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possível atualizar'
  end
  
end
 