require 'rails_helper'
describe "Usuário vê detalhes de um veiculo" do
  
  it 'e vê informações adicionais' do
    #ARRANGE
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password')
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
    #ACT
    visit(root_path) 
    login_as(user)
    visit root_path
    click_on('Veículos')
    click_on('XYZ-123')
    #ASSERT
    expect(page).to have_content('Marca: Chevrolet')
    expect(page).to have_content('Status: Ativo')

  end


end
