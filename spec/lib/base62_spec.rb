require 'rails_helper'

describe Base62 do
  describe '#encode' do
    it 'returns a string' do
      expect(described_class.encode(1632666181170)).to eq 'CUh64EU'
    end
  end

  describe '#decode' do
    it 'returns a string' do
      expect(described_class.decode('CUh64EU')).to eq 1632666181170
    end
  end
end
