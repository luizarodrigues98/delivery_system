class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  
  validates :name, presence: true
  
  before_validation :ensure_email_domain
  
  def description
    "#{name} - #{email}"
  end

  def is_admin?
    admin == true
  end

  private

  def ensure_email_domain
    if self.email.split('@')[1] != 'sistemadefrete.com.br'
        self.errors.add(:email, "deve ter o domínio sistemadefrete.com.br") 
    end
  end
end
