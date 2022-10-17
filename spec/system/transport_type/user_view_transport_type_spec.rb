require 'rails_helper'
describe "Usuário vê detalhes de um tipo de transporte" do
  
  it 'e vê informações adicionais' do
    #ARRANGE
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    #ACT
    visit(index_path) 
    login_as(user)
    visit index_path
    click_on('Modalidade de Transporte')
    click_on('Motocicleta')
    #ASSERT
    expect(page).to have_content('Distância Máxima: 20Km')
    expect(page).to have_content('Taxa fixa: R$ 10,00')

  end

  it 'e volta para a tela inicial' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    #ACT
    visit(index_path) 
    login_as(user)
    visit index_path
    click_on('Modalidade de Transporte')
    click_on('Motocicleta')
    click_on 'Sistema de Fretes'
    expect(current_path).to eq index_path
  end

  it 'e o usuário não é admin' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    #ACT
    visit(index_path) 
    login_as(user)
    visit index_path
    click_on('Modalidade de Transporte')
    expect(page).not_to have_link('Cadastrar Modalidade de Transporte')

  end
  it 'e o usuário regular não vê links do show' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    #ACT
    visit(index_path) 
    login_as(user)
    visit index_path
    click_on('Modalidade de Transporte')
    click_on transport_type.name

    expect(page).not_to have_link('Editar')
    expect(page).not_to have_button('Excluir')
    expect(page).not_to have_button('Desativar')

  end
end
