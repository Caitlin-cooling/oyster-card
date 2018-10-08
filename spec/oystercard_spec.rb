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

  describe 'journey' do
    describe '#in_journey?' do
      it 'has a default value of false' do
        expect(oystercard.in_journey?).to eq false
      end
    end

    describe '#touch_in' do
      it 'changes in_journey status to true' do
        oystercard.touch_in
        expect(oystercard.in_journey?).to eq true
      end
    end

    describe '#touch_out' do
      it 'changes in_journey status to true' do
        oystercard.touch_in
        oystercard.touch_out
        expect(oystercard.in_journey?).to eq false
      end
    end

  end


end
