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

      it 'has a minimum balance' do
        expect { oystercard.touch_in(station) }. to raise_exception "Insufficient funds. Please top-up."
      end

  context 'after a complete journey' do
    it 'charges a minimum fare' do
      topup10
      oystercard.touch_in(station)
      expect{ oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by(-1)
    end
  end
  context 'after an incomplete journey' do
    it 'charges a penalty fare' do
      topup10
      expect{ oystercard.touch_out(exit_station) }.to change{ oystercard.balance }.by(-6)
    end
  end
end
