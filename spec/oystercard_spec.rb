require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let(:topup10)  { oystercard.top_up(10) }
  let(:station) { double(:station)}
  let(:exit_station) { double(:station) }

  describe '#balance' do
    it 'has a default balance of 0' do
      expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
    end
  end

  describe '#top_up' do
    it 'adds money to the card' do
      topup10
      expect(oystercard.balance).to eq 10
    end

    it 'raises exception when top up exceeds maximum' do
      expect { oystercard.top_up(100) }.to raise_exception "Exceeded maximum balance of £#{Oystercard::BALANCE_MAXIMUM}"
    end

    it 'raises exception when balance exceeds maximum after top up' do
      oystercard.top_up(50)
      expect { oystercard.top_up(50) }.to raise_exception "Exceeded maximum balance of £#{Oystercard::BALANCE_MAXIMUM}"
    end
  end

  describe 'journey' do
    describe '#in_journey?' do
      it 'has a default value of false' do
        expect(oystercard.in_journey?).to eq false
      end
    end

    describe '#touch_in' do
      it 'changes in_journey status to true' do
        topup10
        oystercard.touch_in(station)
        expect(oystercard.in_journey?).to eq true
      end

      it 'has a minimum balance' do
        expect { oystercard.touch_in(station) }. to raise_exception "Insufficient funds. Please top-up."
      end

      it 'knows where I have travelled from' do
        topup10
        expect(oystercard.touch_in(station)).to eq station
      end

    end

    describe '#touch_out' do
      it 'changes in_journey status to true' do
        topup10
        oystercard.touch_in(station)
        oystercard.touch_out(station)
        expect(oystercard.in_journey?).to eq false
      end

      it 'deducts the minimum fare when the card is touched out' do
        topup10
        expect { oystercard.touch_out(station)}.to change{ oystercard.balance }.by(-Oystercard::MINIMUM_FARE)
      end

      it 'forgets the entry_station' do
        topup10
        oystercard.touch_in(station)
        oystercard.touch_out(station)
        expect(oystercard.entry_station).to eq nil
      end

      it 'saves the exit station' do
        topup10
        oystercard.touch_in(station)
        oystercard.touch_out(exit_station)
        expect(oystercard.exit_station).to eq exit_station
      end

      it 'saves the journey' do
        topup10
        oystercard.touch_in(station)
        oystercard.touch_out(exit_station)
        expect(oystercard.journeys).to eq [{station => exit_station}]
      end

    end
  end

context 'when initialized' do
  it 'has an empty list of journeys' do
    expect(oystercard.journeys).to eq []
  end
end

end
