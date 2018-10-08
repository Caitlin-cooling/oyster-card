require 'pry'

class Oystercard
  DEFAULT_BALANCE = 0
  attr_accessor :balance

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def top_up(amount)
    # why @balance and not balance?
    @balance += amount
  end

end
