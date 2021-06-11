class Flight < ApplicationRecord
  belongs_to :airline

  validates_presence_of :number
  validates_presence_of :date
  validates_presence_of :departure_city
  validates_presence_of :arrival_city

  def airline_name
    airline.name
  end
end
