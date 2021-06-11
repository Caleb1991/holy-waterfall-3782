class Airline < ApplicationRecord
  has_many :flights, dependent: :destroy
  has_many :passengers, through: :flights

  def adult_passengers
    passengers.where('passengers.age >= ?', 18).distinct
  end

  def frequent_fliers
    passengers.joins(:flights)
      .select('passengers.*')
      .group('passengers.id')
      .select('count(flights.id) as total_flights')
      .order(total_flights: :desc)
      .where('passengers.age >= ?', 18)
      .distinct
  end
end
