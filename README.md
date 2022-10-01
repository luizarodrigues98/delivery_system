# Sistema de Fretes

Esta é a aplicação responsável por gerenciar a frota de entrega para um e-commerce com alcance nacional. Diferentes tipos de transporte são cadastrados, os prazos e os custos. 

## 🚀 Começando

Essas instruções permitirão que você obtenha uma cópia do projeto em operação na sua máquina local para fins de desenvolvimento e teste.


### 📋 Pré-requisitos

De que coisas você precisa para instalar o software e como instalá-lo?

```
Ruby >= 2.5 

Node >= 14
```

### 🔧 Instalação

Instalar as dependências:

```
bundle install

yarn install
```

Criar e popular o banco de dados:

```
rails db:create

rails db:migrate

rails db:seed
```

Execute a aplicação.

```
rails server
```

## ⚙️ Executando os testes

```
rspec
```

## 🛠️ Construído com

Mencione as ferramentas que você usou para criar seu projeto

* [Rails 6.1](https://guides.rubyonrails.org/v6.1/) 
* Ruby 2.5.9
* rspec-rails - framework de testes 
* FactoryBot - gem para facilitar a criação de dados para os testes

