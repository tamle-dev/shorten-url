require 'rails_helper'

describe LinkService::Destroyer do
  let(:resource) { Link.create deleted_at: nil }

  subject { described_class.new(resource) }

  describe '#exec' do
    it 'returns resource with deleted_at is now' do
      Timecop.freeze(Time.zone.now) do
        result = subject.exec

        expect(result).to be_a Link
        expect(result.deleted_at).to be_within(3.seconds).of(Time.zone.now)

        resource.reload
        expect(resource.deleted_at).to be_within(3.seconds).of(Time.zone.now)
      end
    end
  end
end
