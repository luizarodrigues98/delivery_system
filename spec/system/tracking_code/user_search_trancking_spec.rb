require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e vê os campos para pesquisar' do
    visit root_path
    expect(page).to have_content('Rastreamento')  
    expect(page).to have_content('Código')  
    expect(page).to have_button('Buscar')  
    expect(page).to have_content('Sistema de Fretes')  

  end
  it 'e preenche os campos com um código válido' do
    user = User.create!(name: 'User', email:'user@sistemadefrete.com.br', password: 'password', admin: true)
    service = ServiceOrder.create!(address:'rua carvalho mota, 125', dimensions: '10cm x 15cm x 20cm', weight: 2, recipient:'Maria José', status: 0,
      recipient_address: 'rua cruzeiro do sul, 714', sku:'iphone-12s', total_distance: 20)

    login_as(user)
    visit root_path
    fill_in "Código",	with: service.tracking_code
    click_on 'Buscar'
    expect(page).to have_content "Ordem de Serviço: #{service.tracking_code}"
    expect(page).to have_content "Status: Pendente"
    expect(page).to have_content "Destinatário: Maria José"
  end

  it 'e preenche os campos com um código válido' do
    user = User.create!(name: 'User', email:'user@sistemadefrete.com.br', password: 'password', admin: true)
    login_as(user)
    visit root_path
    fill_in "Código",	with: 'ABCDEFG12345678'
    click_on 'Buscar'
    expect(page).to have_content 'Código não encontrado'
    
  end
end