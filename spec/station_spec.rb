require 'station'

describe Station do
  let(:station) { Station.new("Aldgate", 1) }

  context 'When initialized' do
    it 'has a name' do
      expect(station.name).to eq "Aldgate"
    end
    it 'has a zone' do
      expect(station.zone).to eq 1
    end
  end


end
