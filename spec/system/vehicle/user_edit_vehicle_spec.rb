require 'rails_helper'

describe "Usuário edita um veiculo" do


  it 'com sucesso' do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)

    #act
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Veículos'
    click_on 'XYZ-123'
    click_on 'Editar'
    fill_in "Modelo",	with: "Classic" 
    fill_in 'Ano de Fabricação', with: '2018'
    click_on 'Enviar'

    expect(page).to have_content 'Modelo: Classic'
    expect(page).to have_content 'Ano de Fabricação: 2018'
    expect(current_path).to eq vehicle_path(vehicle.id)
    expect(page).not_to have_content 'Ano de Fabricação: 2015' 
  end

  it 'com dados incompletos'do
    #arrange
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Carro', min_distance: 2, max_distance: 200, min_weight: 0, max_weight: 100, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)

    #act
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Veículos'
    click_on 'XYZ-123'
    click_on 'Editar'
    fill_in "Modelo",	with: "Classic" 
    fill_in 'Ano de Fabricação', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possível atualizar o veiculo'
    expect(page).to have_content 'Ano de Fabricação não pode ficar em branco'
  end


end