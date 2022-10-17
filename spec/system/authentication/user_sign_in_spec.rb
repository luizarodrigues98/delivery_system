require 'rails_helper'

describe "Usuario se autentica" do
  it 'com sucesso' do
    #arrange
    user = User.create!(name: "Maria", email: 'maria@sistemadefrete.com.br', password:'password')
    #act
    visit index_path
    within('form') do
      fill_in "E-mail",	with: "maria@sistemadefrete.com.br" 
      fill_in "Senha",	with: "password" 
      click_on "Entrar"
    end
    expect(page).to have_button 'Sair'
  end

  it 'espera ver uma mensagem de sucesso' do
    user = User.create!(name: "Maria", email: 'maria@sistemadefrete.com.br', password:'password')
    visit index_path
    within('form') do
      fill_in "E-mail",	with: 'maria@sistemadefrete.com.br' 
      fill_in "Senha",	with: "password" 
      click_on 'Entrar'
    end
    expect(page).to have_content "Login efetuado com sucesso."
  end

  it 'e faz logout' do
    user = User.create!(name: "Maria", email: 'maria@sistemadefrete.com.br', password:'password')
    
    visit index_path
    within('form') do
      fill_in "E-mail",	with: 'maria@sistemadefrete.com.br' 
      fill_in "Senha",	with: "password" 
      click_on "Entrar"
    end   
    visit index_path
    click_on 'Sair'
    expect(page).to have_content 'Logout efetuado com sucesso.'

    expect(page).not_to have_button 'Sair' 
  end
end
