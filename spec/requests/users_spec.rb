require 'rails_helper'

RSpec.describe "users" do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }

  before do
    user1
    user2
  end

  it 'returns a list of users' do
    get '/users', headers: authorization_header(user1)

    expect(response).to be_success
    expect(json_body.length).to eq(2)
  end

  context 'when there is no authorization header' do
    it 'returns 403 (unauthorized)' do
      get '/users'

      expect(response).to be_unauthorized
    end
  end
end
