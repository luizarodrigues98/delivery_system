require 'rails_helper'

describe "Usuário se autentica" do

  it 'com sucesso' do
    visit index_path
    click_on 'Inscrever-se'
    fill_in "Nome",	with: "Maria" 
    fill_in "E-mail",	with: 'maria@sistemadefrete.com.br'
    fill_in "Senha",	with: "password" 
    fill_in "Confirme sua senha",	with: "password" 
    click_on 'Inscrever-se'
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_button 'Sair'
    user= User.last
    expect(user.name).to eq 'Maria'
  end
end
