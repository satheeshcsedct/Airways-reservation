class Flight < ActiveRecord::Base
  attr_accessible :arrival, :baggage_allowance, :capacity, :departure, :destination, :flight_name, :source
  has_many :seats
end
