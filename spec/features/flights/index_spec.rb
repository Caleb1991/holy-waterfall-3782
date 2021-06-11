require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  before :each do
    @airline_1 = Airline.create!(name: 'Frontier')
    @airline_2 = Airline.create!(name: 'Southwest')

    @flight_1 = @airline_1.flights.create!(number: '1324', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Portland')
    @flight_2 = @airline_1.flights.create!(number: '3124', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Los Angeles')
    @flight_3 = @airline_2.flights.create!(number: '2424', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Las Vegas')
    @flight_4 = @airline_2.flights.create!(number: '5324', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Seattle')

    @passenger_1 = Passenger.create!(name: 'Roald', age: 27)
    @passenger_2 = Passenger.create!(name: 'Huey', age: 33)

    @passenger_flight_1 = PassengerFlight.create!(passenger_id: @passenger_1.id, flight_id: @flight_1.id)
    @passenger_flight_1 = PassengerFlight.create!(passenger_id: @passenger_1.id, flight_id: @flight_2.id)
    @passenger_flight_1 = PassengerFlight.create!(passenger_id: @passenger_2.id, flight_id: @flight_1.id)

    visit '/flights'
  end
#   User Story 1, Flights Index Page
#
# As a visitor
# When I visit the flights index page
# I see a list of all flight numbers
# And next to each flight number I see the name of the Airline of that flight
# And under each flight number I see the names of all that flight's passengers
  it 'shows all flight numbers' do
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_2.number)
    expect(page).to have_content(@flight_3.number)
    expect(page).to have_content(@flight_4.number)
  end
end
