require 'rails_helper'

describe 'Usuário visita tela inicial' do
  it 'e vê o nome da app' do
    user = User.create!(name: 'User', email:'user@sistemadefrete.com.br', password: 'password')
    login_as(user)
    visit root_path

    expect(current_path).to eq root_path
    expect(page).to have_content('Sistema de Fretes')  
    expect(page).to have_link('Sistema de Fretes')  
  end
end