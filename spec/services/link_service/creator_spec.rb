require 'rails_helper'

describe LinkService::Creator do
  let(:params) do
    {
      url: 'url'
    }
  end

  subject { described_class.new(params) }

  before do
    allow(Base62).to receive(:encode).and_return('CT9YN2W')
  end

  describe '#exec' do
    it 'returns a Link' do
      Timecop.freeze(Time.local(2021, 9, 25, 12, 0, 0)) do
        result = subject.exec

        expect(result).to be_a Link
        expect(result.id).to eq 1632546000000
        expect(result.slug).to eq 'CT9YN2W'
        expect(result.url).to eq 'url'
      end
    end

    it 'increases Link count' do
      expect{subject.exec}.to change{Link.count}.by(1)
    end

    it 'calls Base62' do
      expect(Base62).to receive(:encode)

      subject.exec
    end
  end
end
