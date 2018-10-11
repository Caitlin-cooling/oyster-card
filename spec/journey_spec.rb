require 'journey'

describe Journey do
    let(:journey) { Journey.new }
    let(:oystercard) { double(:oystercard) }
    # let(:oystercard) { Oystercard.new }
  context 'when initialized' do
    it 'has an empty list of journeys' do
      expect(journey.history).to eq []
    end

    describe '#fare' do
      it 'charges a minimum fare once a journey is saved' do
        journey.enter(entry_station)
        journey.leave(exit_station)
        journey.save
        expect(journey.fare).to eq Journey::MINIMUM_FARE
      end
      it 'charges a penalty fare when there is no entry station' do
        journey.leave(exit_station)
        journey.save
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end
      it 'charges a penalty fare when there is no exit station' do
        journey.enter(entry_station)
        journey.save
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end
    end
  end
end
