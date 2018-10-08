require 'pry'

class Oystercard
  DEFAULT_BALANCE = 0
  BALANCE_MAXIMUM = 90

  attr_accessor :balance

  def initialize
    @balance = DEFAULT_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    # why @balance and not balance?
    fail "Exceeded maximum balance of £#{BALANCE_MAXIMUM}" if (@balance + amount > BALANCE_MAXIMUM)
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def deduct(fare)
    @balance -= fare
  end

end
