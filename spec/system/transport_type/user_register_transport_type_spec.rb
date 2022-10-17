require 'rails_helper'

describe "Usuário cadastra uma modalidade de transporte" do


  it 'a partir da tela inicial' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)

    #act
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on 'Cadastrar Modalidade de Transporte'
    #assert
    expect(page).to have_field('Nome') 
    expect(page).to have_field('Distância Mínima')
    expect(page).to have_field('Distância Máxima')    
    expect(page).to have_field('Taxa fixa')
    expect(page).to have_field('Peso Mínimo')
    expect(page).to have_field('Peso Máximo')

  end

  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    
    #act
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on 'Cadastrar Modalidade de Transporte'
    fill_in "Nome",	with: "Caminhão Pequeno"
    fill_in 'Distância Mínima',	with: 0
    fill_in 'Distância Máxima',	with: 500
    fill_in 'Taxa fixa',	with: 1000  
    fill_in "Peso Mínimo",	with: 0 
    fill_in 'Peso Máximo',	with: 500
    click_on 'Enviar'
    #assert
    expect(current_path).to  eq transport_types_path 
    expect(page).to have_content 'Modalidade de transporte cadastrado com sucesso.' 
    expect(page).to have_content 'Caminhão Pequeno' 
    expect(page).to have_content 'Distância Máxima: 500Km'
     

  end

  it 'com dados incompletos' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    
    #act
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on 'Cadastrar Modalidade de Transporte'
    fill_in "Nome",	with: ""
    fill_in 'Distância Mínima',	with: nil 
    fill_in 'Distância Máxima',	with: nil
    fill_in 'Taxa fixa',	with: 1000  
    fill_in "Peso Mínimo",	with: 0 
    fill_in 'Peso Máximo',	with: 500
    click_on 'Enviar'
    #assert
    expect(current_path).to  eq transport_types_path 
    expect(page).to have_content 'Modalidade de transporte não cadastrado' 

  end
end
 