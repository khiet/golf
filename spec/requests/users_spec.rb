require 'rails_helper'

RSpec.describe "users" do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  before do
    user1
    user2
  end

  describe 'GET users' do
    it 'returns a list of users' do
      get '/users', headers: authorization_header(user1)

      expect(response).to be_ok
      expect(json_body.length).to eq(2)
      expect(json_body.first.keys).to match_array(['id', 'email', 'role'])
    end

    context 'when there is no authorization header' do
      it 'returns 403 (unauthorized)' do
        get '/users'

        expect(response).to be_unauthorized
      end
    end
  end

  describe 'POST users' do
    let(:email)    { 'test@estemity.com' }
    let(:password) { 'password123' }

    let(:params) do
      { email: email, password: password }
    end

    it 'creates a user with email and password' do
      expect { post '/users', params: params }.to change { User.count }.by(1)

      expect(response).to be_created
      expect(json_body.keys).to match_array(['id', 'email'])
      expect(json_body['email']).to eq email
    end

    context 'when validation fails' do
      let(:email) { 'foobar' }

      it 'returns an error' do
        expect { post '/users', params: params }.not_to change { User.count }

        expect(response).to be_bad_request
        expect(json_body['error']).to eq 'Email is invalid'
      end
    end
  end
end
