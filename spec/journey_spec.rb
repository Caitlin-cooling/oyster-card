require 'journey'

describe Journey do
    let(:journey) { Journey.new }
    let(:oystercard) { double(:oystercard) }
    # let(:oystercard) { Oystercard.new }
    let(:entry_station) { "Aldgate" }
    let(:exit_station) { "Aldgate East"}

  context 'when initialized' do
    it 'has an empty list of journeys' do
      expect(journey.history).to eq []
    end

    context 'on completed journey' do
      it 'saves the journey' do
        journey.enter(entry_station)
        journey.leave(exit_station)
        journey.save
        expect(journey.history).to eq [{entry_station => exit_station}]
      end
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
