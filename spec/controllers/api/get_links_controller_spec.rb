require 'rails_helper'

describe Api::GetLinksController, type: :request do
  describe 'get /api/links' do
    include_context 'api_auth'

    let(:action) { get '/api/links', headers: headers }

    context 'when success' do
      before do
        Link.create url: 'url', deleted_at: nil, created_by: current_user_id
      end

      it 'responds status 200' do
        action
        expect(response.status).to eq 200

        json = JSON.parse(response.body)
        expect(json).to have_key 'data'
        expect(json['data'].count).to eq 1
        expect(json['data'][0]).to have_key 'id'
        expect(json['data'][0]).to have_key 'url'
        expect(json['data'][0]).to have_key 'slug'
        expect(json['data'][0]).to have_key 'clicked'
        expect(json['data'][0]).to have_key 'shorten_url'

        expect(json).to have_key 'paging'
        expect(json['paging']).to have_key 'current_page'
        expect(json['paging']).to have_key 'prev_page'
        expect(json['paging']).to have_key 'next_page'
        expect(json['paging']).to have_key 'total_count'
        expect(json['paging']).to have_key 'total_pages'
      end
    end
  end
end
