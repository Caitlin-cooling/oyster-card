require 'pry'

class Oystercard
  DEFAULT_BALANCE = 0
  BALANCE_MAXIMUM = 90
  BALANCE_MINIMUM = 1
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :journeys, :exit_station

  def initialize
    @balance = DEFAULT_BALANCE
    @entry_station = nil
    @exit_station = nil
    @journeys = []
  end

  def top_up(amount)
    fail "Exceeded maximum balance of £#{BALANCE_MAXIMUM}" if (@balance + amount > BALANCE_MAXIMUM)
    @balance += amount
  end

  def in_journey?
    entry_station != nil
  end

  def touch_in(station)
    fail "Insufficient funds. Please top-up." if @balance < BALANCE_MINIMUM
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @exit_station = station
    save_journey
    end_journey
  end

  private

  def deduct(fare)
    @balance -= fare
  end

  def save_journey
    @journeys << {@entry_station => @exit_station}
  end

  def end_journey
    @entry_station = nil
  end

end
