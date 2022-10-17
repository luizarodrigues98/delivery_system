require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#dominium' do
    it 'tem o dominio correto' do
      user = User.create!(name:'Carlos', email: 'carlos@sistemadefrete.com.br', password: 'password') 
      result = user.email.split('@')[1]  
      
      expect(result).to eq 'sistemadefrete.com.br'
    end

    it 'tem o dominio incorreto e não é valido' do
      user = User.new(name:'Carlos', email: 'carlos@gmail.com.br', password: 'password') 
      
      expect(user).to_not be_valid
    end
  end

end
