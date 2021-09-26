require 'rails_helper'

describe LinkService::Updater do
  let(:resource) { Link.create clicked: 1 }
  let(:params) do
    {
      clicked: 2
    }
  end

  subject { described_class.new(resource, params) }

  describe '#exec' do
    it 'returns updated resource' do
      result = subject.exec

      expect(result).to be_a Link
      expect(result.clicked).to eq 2
      expect(resource.clicked).to eq 2
    end
  end
end
