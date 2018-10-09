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
    context 'on tap out' do
      it 'saves the journey' do
        # oystercard.touch_in(entry_station)
        # oystercard.touch_out(exit_station)
        expect(journey.history).to eq [{entry_station => exit_station}]
      end
    end
  end
end
