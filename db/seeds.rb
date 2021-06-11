Airline.destroy_all
Flight.destroy_all
Passenger.destroy_all
PassengerFlight.destroy_all

@airline_1 = Airline.create!(name: 'Frontier')
@airline_2 = Airline.create!(name: 'Southwest')
@airline_3 = Airline.create!(name: 'American')

@flight_1 = @airline_1.flights.create!(number: '1324', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Portland')
@flight_2 = @airline_1.flights.create!(number: '3124', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Los Angeles')
@flight_3 = @airline_2.flights.create!(number: '2424', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Las Vegas')
@flight_4 = @airline_2.flights.create!(number: '5324', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Seattle')

@passenger_1 = Passenger.create!(name: 'Roald', age: 27)
@passenger_2 = Passenger.create!(name: 'Big Rick', age: 4)
@passenger_3 = Passenger.create!(name: 'Larry', age: 7)
@passenger_4 = Passenger.create!(name: 'Deku', age: 28)
@passenger_5 = Passenger.create!(name: 'Don', age: 28)
@passenger_6 = Passenger.create!(name: 'Huey', age: 33)

@passenger_flight_1 = PassengerFlight.create!(passenger_id: @passenger_1.id, flight_id: @flight_1.id)
@passenger_flight_2 = PassengerFlight.create!(passenger_id: @passenger_1.id, flight_id: @flight_2.id)
@passenger_flight_3 = PassengerFlight.create!(passenger_id: @passenger_2.id, flight_id: @flight_1.id)
@passenger_flight_4 = PassengerFlight.create!(passenger_id: @passenger_2.id, flight_id: @flight_1.id)
@passenger_flight_5 = PassengerFlight.create!(passenger_id: @passenger_3.id, flight_id: @flight_1.id)
@passenger_flight_6 = PassengerFlight.create!(passenger_id: @passenger_4.id, flight_id: @flight_1.id)
@passenger_flight_7 = PassengerFlight.create!(passenger_id: @passenger_5.id, flight_id: @flight_1.id)
@passenger_flight_8 = PassengerFlight.create!(passenger_id: @passenger_6.id, flight_id: @flight_1.id)
