require 'rails_helper'
describe "Usuário(admin) vê todos os usuários regulares" do
  
  it 'a partir da tela inicial' do
    #ARRANGE
    user = User.create!(name: 'Luiza', email: 'luiza@sistemadefrete.com.br', password: 'password', admin: true)
    third_user = User.create!(name: 'lucas', email: 'lucas@sistemadefrete.com.br', password: 'password', admin: true)
    second_user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')
    last_user = User.create!(name: 'Teste', email: 'teste@sistemadefrete.com.br', password: 'password')
    
    #ACT
    visit(index_path) 
    login_as(user)
    visit index_path
    click_on('Usuários')
    #ASSERT
    expect(page).to have_content('joao@sistemadefrete.com.br')
    expect(page).to have_content('teste@sistemadefrete.com.br')

  end

end
