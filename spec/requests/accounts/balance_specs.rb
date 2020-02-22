require 'rails_helper'

RSpec.describe "Balance Action", type: :request do

  it "should return user not found" do
    get '/api/accounts/balance.json?user_id=213'

    expect(response).to be_not_found
    expect(JSON.parse(response.body)['error']).to eq('User not found.')
  end

  it "should return success with user balance" do
    get '/api/accounts/balance.json?user_id=1'

    expect(response).to be_ok
    expect(JSON.parse(response.body)['balance']).to eq(10.0)
  end
end