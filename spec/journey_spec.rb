require 'journey'

describe Journey do
  let(:journey) { Journey.new(journeylog) }
  let(:journeylog) { JourneyLog.new }
  let(:entry_station) { "Aldgate East" }
  let(:exit_station) { "Wimbledon" }

  describe '#fare' do
    it 'charges a minimum fare once a journey is saved' do
      journeylog.enter(entry_station)
      journeylog.leave(exit_station)
      journeylog.save
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
    it 'charges a penalty fare when there is no entry station' do
      journeylog.leave(exit_station)
      journeylog.save
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end
    it 'charges a penalty fare when there is no exit station' do
      journeylog.enter(entry_station)
      journeylog.save
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

  end
end
