require 'rails_helper'

describe Api::LoginController, type: :request do
  describe 'post /api/users/login' do
    let(:email)     { 'tamle.dev@outlook.com' }
    let(:password)  { 'secret' }
    let(:params) do
      {
        email:    email,
        password: password
      }
    end
    let(:action) { post '/api/users/login', params: params, headers: {} }

    before do
      User.create email: email, password: password
    end

    context 'when success' do
      it 'responds status 200' do
        action
        expect(response.status).to eq 200

        json = JSON.parse response.body
        expect(json).to have_key 'data'
        expect(json).to have_key 'auth_token'
      end

      context 'when email has upcase' do
        let(:params) do
          {
            email:    'tamle.DEV@outlook.com',
            password: password
          }
        end

        it 'responds status 200' do
          action
          expect(response.status).to eq 200

          json = JSON.parse response.body
          expect(json).to have_key 'data'
          expect(json).to have_key 'auth_token'
        end
      end
    end

    context 'when error' do
      context 'when invalid email' do
        let(:params) do
          {
            email:    'user1@sample.com',
            password: password
          }
        end

        it 'responds status 400' do
          action
          expect(response.status).to eq 400
        end
      end


      context 'when invalid password' do
        let(:params) do
          {
            email:    email,
            password: 'abc123451'
          }
        end

        it 'responds status 400' do
          action
          expect(response.status).to eq 400
        end
      end
    end
  end
end
