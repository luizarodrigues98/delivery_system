user = User.create(name: "Maria", email: 'maria@sistemadefrete.com.br', password:'password', admin: true)
second_user = User.create!(name: 'João', email: 'joao@sistemadefrete.com.br', password: 'password')

transport_type = TransportType.create!(name: 'Motocicleta', min_distance: 2, max_distance: 20, min_weight: 0, max_weight: 10, fixed_rate: 1000, active: true)
price_per_distance= PricePerDistance.create!(start_distance: 0, end_distance: 30, rate: 9, transport_type_id: transport_type.id)
price_per_weight = PricePerWeight.create!(start_weight: 0, end_weight: 10, value_per_distance: 0.5, transport_type_id: transport_type.id)
arrival_time = ArrivalTimeConfig.create!(start_distance: 0, end_distance: 10, hours: 5, transport_type_id: transport_type.id)
vehicle = Vehicle.create!(plate: 'XYZ-123', brand:'Chevrolet', model: 'GOL', status: 0, max_weight: 100, fabrication_year: 2015, transport_type: transport_type)
