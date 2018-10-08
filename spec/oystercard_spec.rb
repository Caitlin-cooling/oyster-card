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
  end

end
