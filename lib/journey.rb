class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  attr_reader :history

  def initialize
    @history = []
    @entry_station = nil
    @exit_station = nil
  end

  def enter(station)
    @entry_station = station
  end

  def leave(station)
    @exit_station = station
  end

  def save
    @history << {@entry_station => @exit_station}
  end

  def fare
    penalty? ? PENALTY_FARE : MINIMUM_FARE
  end


  private

  def penalty?
    @entry_station == nil || @exit_station == nil
  end
end
