require 'rails_helper'

describe "Usuário edita uma modalidade de transporte" do


  it 'a partir da página de detalhes' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    
    #act
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Editar'
    #assert
    expect(page).to have_content 'Editar Modalidade de Transporte'
    expect(page).to have_field('Distância Mínima', with: 2)
    expect(page).to have_field('Taxa fixa', with: 10.00)

  end
  it 'com sucesso' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    
    #act
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Editar'
    fill_in "Nome",	with: "Moto"
    fill_in "Distância Máxima",	with: 15
    fill_in "Taxa fixa",	with: 50
    
    click_on 'Enviar'
    expect(page).to have_content 'Modalidade de transporte atualizado com sucesso' 
    expect(page).to have_content 'Moto'
    expect(page).to have_content 'Distância Máxima: 15Km'
  end
  
  it "e mantém os campos obrigatórios" do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)

    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Editar'
    fill_in "Nome",	with: ""
    fill_in "Distância Máxima",	with: ""
    fill_in "Taxa fixa",	with: ""
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possível atualizar a modalidade de transporte'
  end
  
end
 