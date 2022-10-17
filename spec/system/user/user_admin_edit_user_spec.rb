require 'rails_helper'
describe "Usuário(admin) edita um usuário regular" do
  
  it 'com sucesso' do
    #ARRANGE
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    second_user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')
    
    #ACT
    login_as(user)
    visit index_path
    click_on('Usuários')
    within 'table', id: 'user' do
      click_on 'Editar'
    end
    fill_in 'Nome', with: 'Teste'
    click_on 'Enviar'
    #ASSERT
    expect(page).to have_content('joao@sistemadefrete.com.br')
    expect(page).to have_content('Teste')
    expect(page).not_to have_content('João')

  end
  
  it 'com dados incompletos' do
    #ARRANGE
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    second_user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')
    
    #ACT
    login_as(user)
    visit index_path
    click_on('Usuários')
    within 'table', id: 'user' do
      click_on 'Editar'
    end
    fill_in 'Nome', with: ''
    click_on 'Enviar'
    #ASSERT
    expect(page).to have_content('Não foi possível atualizar o usuário')
    expect(page).not_to have_content('João')
  end
end
