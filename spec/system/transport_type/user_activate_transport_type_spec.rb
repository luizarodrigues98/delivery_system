require 'rails_helper'

describe "Usuário ativa uma modalidade de transporte" do
  it 'a partir da página de detalhes' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: false)
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Ativar'

    expect(page).to have_content 'Status da modalidade: ativado'
  end
end
describe "Usuário desativa uma modalidade de transporte" do
  it 'a partir da página de detalhes' do
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
    visit index_path
    login_as(user)
    visit index_path
    click_on 'Modalidade de Transporte'
    click_on transport_type.name
    click_on 'Desativar'

    expect(page).to have_content 'Status da modalidade: desativado'
  end
end