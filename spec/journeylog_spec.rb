require 'journeylog'

describe JourneyLog do

    let(:oystercard) { double(:oystercard) }
    let(:entry_station) { "Aldgate" }
    let(:exit_station) { "Aldgate East"}
    let(:journey_log) { double(:journey_log)}
    let(:log) { JourneyLog.new(journey_log) }

  it 'initializes with journey' do
    expect(log).to eq log
  end

  context 'on completed journey' do
    it 'saves the journey' do
      log.enter(entry_station)
      log.leave(exit_station)
      log.save
      expect(log.history).to eq [{entry_station => exit_station}]
    end
  end

  context 'incomplete journey?' do
    it 'should return incoplete journey' do
      log.enter(entry_station)
      expect(log.in_journey?).to eq true
    end

    it 'should return false if completed journey' do
      log.enter(entry_station)
      log.leave(exit_station)
      expect(log.in_journey?).to eq false
    end
  end

end
