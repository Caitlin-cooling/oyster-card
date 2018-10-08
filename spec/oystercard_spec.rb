require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }
  let (:topup10)  { oystercard.top_up(10) }

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
        oystercard.touch_in
        expect(oystercard.in_journey?).to eq true
      end

      it 'has a minimum balance' do
        expect { oystercard.touch_in }. to raise_exception "Insufficient funds. Please top-up."
      end
    end

    describe '#touch_out' do
      it 'changes in_journey status to true' do
        topup10
        oystercard.touch_in
        oystercard.touch_out
        expect(oystercard.in_journey?).to eq false
      end
    end

  end

  describe '#deduct' do
    it 'deduct a fare from the users balance' do
      topup10
      oystercard.deduct(6)
      expect(oystercard.balance).to eq 4
    end

    it 'deduct a fare from the users balance' do
      topup10
      expect{ oystercard.deduct 5}.to change{ oystercard.balance }.by -5
    end
  end

end
