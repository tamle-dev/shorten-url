require 'rails_helper'

describe Api::GetLinkController, type: :request do
  describe 'get /api/links/:slug' do
    include_context 'api_auth'

    let(:link) { Link.create slug: 'Hcas23a' }
    let(:slug) { link.slug }

    let(:action) { get "/api/links/#{slug}", headers: headers }

    before do
      allow_any_instance_of(LinkService::Parser).to receive(:exec).and_return(link)
    end

    context 'when success' do
      it 'responds keyword' do
        action
        expect(response.status).to eq 200

        json = JSON.parse(response.body)
        expect(json).to have_key 'data'
        expect(json['data']).to have_key 'id'
        expect(json['data']).to have_key 'id'
        expect(json['data']).to have_key 'url'
        expect(json['data']).to have_key 'slug'
        expect(json['data']).to have_key 'clicked'
        expect(json['data']).to have_key 'shorten_url'
      end

      it 'calls LinkService::Parser' do
        expect_any_instance_of(LinkService::Parser).to receive(:exec).and_return(link)

        action
      end
    end

    context 'when error' do
      context 'when invalid slug' do
        before do
          allow_any_instance_of(LinkService::Parser).to receive(:exec).and_return(nil)
        end

        it 'responds status 400' do
          action
          expect(response.status).to eq 400
        end
      end
    end
  end
end
