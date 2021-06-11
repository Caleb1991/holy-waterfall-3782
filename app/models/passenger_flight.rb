class PassengerFlight < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  def self.find_first_association(passenger_id, flight_id)
    where(passenger_id: passenger_id, flight_id: flight_id).first
  end
end
