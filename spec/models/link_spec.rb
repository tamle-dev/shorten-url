require 'rails_helper'

RSpec.describe Link, type: :model do
  describe '.active' do
    it 'returns right data' do
      l1 = Link.create deleted_at: nil
      l2 = Link.create deleted_at: Time.zone.now
      l3 = Link.create deleted_at: nil

      expect(described_class.active.to_a).to eq([l1, l3])
    end
  end

  describe '.shorten_url' do
    let(:resource) { described_class.new slug: 'CUh64EU'}

    it 'returns right data' do
      expect(resource.shorten_url).to eq "#{ENV['BASE_DOMAIN']}/CUh64EU"
    end
  end
end
