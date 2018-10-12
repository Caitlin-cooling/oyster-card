require_relative 'journey'

class JourneyLog

  attr_reader :journey_class, :entry_station, :exit_station

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @entry_station = nil
    @exit_station = nil
    @history = []
  end

  def history
    @history.dup
  end

    def enter(station)
      @entry_station = nil
      @exit_station = nil
      @entry_station = station
    end

    def leave(station)
      @exit_station = station
      save
    end

    # this perhaps needs to be private?
    def save
      @history << {@entry_station => @exit_station}
    end

    def in_journey?
      @exit_station == nil ? true : false
    end

    # private
    def current_journey
      @current_journey ||= journey_class.new(self)
    end

end
