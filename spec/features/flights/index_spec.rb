require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  before :each do
    @airline_1 = Airline.create!(name: 'Frontier')
    @airline_2 = Airline.create!(name: 'Southwest')
    @airline_3 = Airline.create!(name: 'American')

    @flight_1 = @airline_1.flights.create!(number: '1324', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Portland')
    @flight_2 = @airline_1.flights.create!(number: '3124', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Los Angeles')
    @flight_3 = @airline_2.flights.create!(number: '2424', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Las Vegas')
    @flight_4 = @airline_2.flights.create!(number: '5324', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Seattle')

    @passenger_1 = Passenger.create!(name: 'Roald', age: 27)
    @passenger_2 = Passenger.create!(name: 'Huey', age: 33)

    @passenger_flight_1 = PassengerFlight.create!(passenger_id: @passenger_1.id, flight_id: @flight_1.id)
    @passenger_flight_2 = PassengerFlight.create!(passenger_id: @passenger_1.id, flight_id: @flight_2.id)
    @passenger_flight_3 = PassengerFlight.create!(passenger_id: @passenger_2.id, flight_id: @flight_1.id)

    visit '/flights'
  end

  it 'shows all flight numbers' do
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_2.number)
    expect(page).to have_content(@flight_3.number)
    expect(page).to have_content(@flight_4.number)
  end

  it 'shows what airline that flight is associated with' do
    expect(page).to have_content(@airline_1.name)
    expect(page).to have_content(@airline_2.name)
    expect(page).to_not have_content(@airline_3.name)
  end

  it 'shows all the passengers on that flight' do
    expect(page).to have_content(@passenger_1.name, count: 4)
    expect(page).to have_content(@passenger_2.name, count: 2)
  end

  it 'has a link to remove a passenger' do
    expect(page).to have_link("Remove #{@passenger_1.name} From Flight")
  end

  it 'can remove a passenger from a flight' do
    expect(page).to have_content(@passenger_2.name)

    click_on "Remove #{@passenger_2.name} From Flight"

    expect(current_path).to eq('/flights')

    expect(page).to_not have_content(@passenger_2.name)
  end
end
