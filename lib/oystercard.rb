require 'pry'

class Oystercard
  DEFAULT_BALANCE = 0
  BALANCE_MAXIMUM = 90
  BALANCE_MINIMUM = 1
  MINIMUM_FARE = 1

  attr_accessor :balance, :entry_station

  def initialize
    @balance = DEFAULT_BALANCE
    @entry_station = nil
  end

  def top_up(amount)
    # why @balance and not balance?
    fail "Exceeded maximum balance of £#{BALANCE_MAXIMUM}" if (@balance + amount > BALANCE_MAXIMUM)
    @balance += amount
  end

  def in_journey?
    entry_station == nil ? false : true
    # !!entry_station
  end

  def touch_in(station)
    fail "Insufficient funds. Please top-up." if @balance < BALANCE_MINIMUM
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
