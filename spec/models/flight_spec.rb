require 'rails_helper'

RSpec.describe Flight, type: :model do
  before :each do
    @airline_1 = Airline.create!(name: 'Southwest')
    @airline_2 = Airline.create!(name: 'Frontier')

    @flight_1 = @airline_1.flights.create!(number: '1324', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Portland')
    @flight_2 = @airline_2.flights.create!(number: '3124', date: '09/08/07', departure_city: 'Denver', arrival_city: 'Los Angeles')
  end

    describe 'relationships' do
    it {should belong_to :airline}
    it {should have_many(:passenger_flights)}
    it {should have_many(:passengers).through(:passenger_flights)}
  end

  describe 'validations' do
    it {should validate_presence_of(:number)}
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:departure_city)}
    it {should validate_presence_of(:arrival_city)}
  end

  describe 'instance methods' do
    describe '#airline_name' do
      it 'returns the name of the flights airline' do
        expect(@flight_1.airline_name).to eq('Southwest')
      end
    end
  end
end
