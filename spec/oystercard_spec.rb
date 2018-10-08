require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }

  it 'has a default balance of 0' do
    expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
  end
end
