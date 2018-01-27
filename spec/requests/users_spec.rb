require 'rails_helper'

RSpec.describe "users" do
  it "displays the user's username after successful login" do
    get '/users'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json['users'].length).to eq(10)
  end
end
