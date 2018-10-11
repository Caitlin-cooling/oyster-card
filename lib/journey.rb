require_relative 'journeylog'

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :history

  def initialize
  end

  def fare
    penalty? ? PENALTY_FARE : MINIMUM_FARE
  end


  private

  def penalty?
    @entry_station == nil || @exit_station == nil
  end
end
