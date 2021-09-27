require 'rails_helper'

describe Api::ShortenLinkController, type: :request do
  describe 'post /api/links/shorten' do
    include_context 'api_auth'

    let(:url) { 'http://google.com' }
    let(:params) do 
      { 
        url: url
      }
    end
    let(:action) { post '/api/links/shorten', params: params, headers: headers }

    before do
      link = Link.create
      allow_any_instance_of(LinkService::Creator).to receive(:exec).and_return link
    end

    context 'when success' do
      it 'responds status 201' do
        action
        expect(response.status).to eq 201

        json = JSON.parse response.body
        expect(json).to have_key 'data'
        expect(json['data']).to have_key 'id'
        expect(json['data']).to have_key 'url'
        expect(json['data']).to have_key 'shorten_url'
        expect(json['data']).to have_key 'slug'
        expect(json['data']).to have_key 'clicked'
      end

      it 'calls AttachmentService::Creator' do
        expect_any_instance_of(LinkService::Creator).to receive(:exec)

        action
      end
    end

    context 'when error' do
      context 'when missing params url' do
        let(:url) { nil }

        it 'responds status 400' do
          action

          expect(response.status).to eq 400
        end
      end
    end
  end
end
