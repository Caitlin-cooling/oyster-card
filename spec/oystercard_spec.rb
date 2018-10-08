require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }

  describe '#balance' do
    it 'has a default balance of 0' do
      expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
    end
  end

  describe '#top_up' do
    it 'adds money to the card' do
      oystercard.top_up(10)
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

end
