require 'rails_helper'

describe "Usuário cadastra uma configuração de prazo" do


  it 'a partir da tela de show de modalidade de transporte' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)

    #act
    login_as(user)
    visit root_path
    within 'header' do
      click_on 'Modalidade de Transporte'
    end    
    click_on transport_type.name
    click_on 'Cadastrar Configuração de Prazo'
    #assert
    expect(page).to have_field('Distância Inicial') 
    expect(page).to have_field('Distância Final')
    expect(page).to have_field('Horas')


  end

  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    
    #act
    login_as(user)
    visit root_path
    within 'header' do
      click_on 'Modalidade de Transporte'
    end    
    click_on transport_type.name
    click_on 'Cadastrar Configuração de Prazo'

    fill_in 'Distância Inicial',	with: 5
    fill_in 'Distância Final',	with: 25
    fill_in 'Horas',	with: 10  
 
    click_on 'Enviar'
    #assert
    expect(current_path).to  eq transport_type_path(transport_type.id)
    expect(page).to have_content 'Cadastrado com sucesso' 
    expect(page).to have_content '10h' 
    expect(page).to have_content '5Km - 25Km'
  end

  it 'com dados incompletos' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    
    #act
    login_as(user)
    visit root_path
    within 'header' do
      click_on 'Modalidade de Transporte'
    end    
    click_on transport_type.name
    click_on 'Cadastrar Configuração de Prazo'

    fill_in 'Distância Inicial',	with: 5
    fill_in 'Distância Final',	with: nil
    fill_in 'Horas',	with: 2
 
    click_on 'Enviar'
    #assert
    expect(page).to have_content 'Distância Final não pode ficar em branco' 
  end
end
 