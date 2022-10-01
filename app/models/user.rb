class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  
  validates :name, presence: true
  
  before_validation :ensure_email_domain

  private

  def ensure_email_domain
    if self.email.split('@')[1] != 'sistemadefrete.com.br'
        self.errors.add(:email, "deve ter o domínio sistemadefrete.com.br") 
    end
  end
end
