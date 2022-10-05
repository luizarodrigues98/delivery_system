require 'rails_helper'
describe "Usuário vê detalhes de um tipo de transporte" do
  
  it 'e vê informações adicionais' do
    #ARRANGE
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    #ACT
    visit(root_path) 
    login_as(user)
    visit root_path
    click_on('Modalidade de Transporte')
    click_on('Motocicleta')
    #ASSERT
    expect(page).to have_content('Distância Máxima: 20Km')
    expect(page).to have_content('Taxa fixa: R$1000')

  end

  it 'e volta para a tela inicial' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    #ACT
    visit(root_path) 
    login_as(user)
    visit root_path
    click_on('Modalidade de Transporte')
    click_on('Motocicleta')
    click_on 'Sistema de Fretes'
    expect(current_path).to eq root_path
  end
end
