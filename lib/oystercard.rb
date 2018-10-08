require 'pry'

class Oystercard
  DEFAULT_BALANCE = 0
  BALANCE_MAXIMUM = 90
  attr_accessor :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    # why @balance and not balance?
    fail "Exceeded maximum balance of £#{BALANCE_MAXIMUM}" if (@balance + amount > BALANCE_MAXIMUM)
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare 
  end

end
