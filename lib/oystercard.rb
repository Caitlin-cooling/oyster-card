require 'pry'
require_relative 'journey'
require_relative 'journeylog'


class Oystercard
  DEFAULT_BALANCE = 0
  BALANCE_MAXIMUM = 90
  BALANCE_MINIMUM = 1

  attr_reader :balance, :entry_station, :journeys, :exit_station

  def initialize
    @balance = DEFAULT_BALANCE
    @journeys = JourneyLog.new
  end

  def top_up(amount)
    fail "Exceeded maximum balance of £#{BALANCE_MAXIMUM}" if (@balance + amount > BALANCE_MAXIMUM)
    @balance += amount
  end

  def touch_in(station)
    @journeys.enter(station)
    fail "Insufficient funds. Please top-up." if @balance < BALANCE_MINIMUM
  end

  def touch_out(station)
    @journeys.leave(station)
    @balance -= @journeys.current_journey.fare # This is bad, how can I do it better?
  end

end
