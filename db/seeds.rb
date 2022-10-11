user = User.create(name: "Maria", email: 'maria@sistemadefrete.com.br', password:'password', admin: true)
transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
