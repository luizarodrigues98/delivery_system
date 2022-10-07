require 'rails_helper'
describe "Usuário(admin) edita um usuário regular" do
  
  it 'com sucesso' do
    #ARRANGE
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    second_user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')
    
    #ACT
    visit(root_path) 
    login_as(user)
    visit root_path
    click_on('Usuários')
    within 'table' do
      click_on 'Editar'
    end
    fill_in 'Nome', with: 'Teste'
    click_on 'Enviar'
    #ASSERT
    expect(page).to have_content('joao@sistemadefrete.com.br')
    expect(page).to have_content('Teste')
    expect(page).not_to have_content('João')

  end

end
