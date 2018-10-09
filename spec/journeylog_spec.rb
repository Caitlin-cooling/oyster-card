require 'journeylog'

describe JourneyLog do

    let(:oystercard) { double(:oystercard) }

  it 'is initialized with an oystercard' do
    log = JourneyLog.new(oystercard)
    expect(log.journey_class).to eq oystercard
  end
end
