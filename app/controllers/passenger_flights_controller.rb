class PassengerFlightsController < ApplicationController
  def destroy
    passenger_flight = PassengerFlight.find_first_association(params[:id], params[:flight_id])

    PassengerFlight.destroy(passenger_flight.id)

    redirect_to '/flights'
  end
end
