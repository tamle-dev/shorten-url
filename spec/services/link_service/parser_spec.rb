require 'rails_helper'

describe LinkService::Parser do
  let(:slug)      { 'CT9YN2W' }
  let!(:resource) { Link.create id: 2523541123, deleted_at: nil }

  subject { described_class.new(slug) }

  before do
    allow(Base62).to receive(:decode).and_return(2523541123)
  end

  describe '#exec' do
    it 'returns resource' do
      result = subject.exec

      expect(result).to be_a Link
      expect(result).to eq resource
    end

    context 'when invalid slug' do
      before do
        allow(Base62).to receive(:decode).and_return(2523541124)
      end

      it 'returns nil' do
        result = subject.exec
  
        expect(result).to be_nil
      end
    end
  end
end
