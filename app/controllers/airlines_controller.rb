class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])

    @adult_passengers = @airline.frequent_fliers
  end
end
