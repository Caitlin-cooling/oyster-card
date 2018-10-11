require_relative 'journeylog'

class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize(log)
    @log = log
  end

  def fare
    penalty? ? PENALTY_FARE : MINIMUM_FARE
  end

  private

  def penalty?
    p @log
    @log.entry_station == nil || @log.exit_station == nil
  end
end
