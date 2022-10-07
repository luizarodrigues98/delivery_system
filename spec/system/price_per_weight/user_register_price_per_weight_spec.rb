require 'rails_helper'

describe "Usuário cadastra uma configuração de preço por peso" do


  it 'a partir da tela de show de modalidade de transporte' do
    #arrange
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
    click_on 'Modalidade de Transporte'
    click_on transport_type.name

    fill_in 'Peso inicial',	with: 0
    fill_in 'Peso final',	with: 500
    fill_in 'Taxa',	with: 1000  
 
    click_on 'Enviar'
    #assert
    expect(current_path).to  eq transport_type_path(transport_type.id)
    expect(page).to have_content 'Modalidade de transporte cadastrado com sucesso.' 
    expect(page).to have_content ' ' 
    expect(page).to have_content ' '
     

  end

  it 'com dados incompletos' do
  end
end
 