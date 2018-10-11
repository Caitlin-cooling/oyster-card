require_relative 'journey'

class JourneyLog

  attr_reader :journey_class, :history

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @entry_station = nil
    @exit_station = nil
    @history = []
  end

    def enter(station)
      @entry_station = station
    end

    def leave(station)
      @exit_station = station
    end

    def save
      @history << {@entry_station => @exit_station}
      @entry_station = nil
      @exit_station = nil
    end

    def in_journey?
      @exit_station == nil ? true : false
    end


end
