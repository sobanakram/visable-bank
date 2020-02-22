require 'rails_helper'

RSpec.describe "Transfer Action", type: :request do

  it "should return amount error" do
    post '/api/accounts/transfer.json', {}

    expect(response.status).to eq(422)
    expect(JSON.parse(response.body)['error']).to eq('Amount should be greater then 0.')
  end

  it "should return from user not found" do
    post '/api/accounts/transfer.json', params: { amount: 1 }

    expect(response).to be_not_found
    expect(JSON.parse(response.body)['error']).to eq('From user not found.')
  end

  it "should return to user not found" do
    post '/api/accounts/transfer.json', params: { from_user_id: 2, amount: 1 }

    expect(response).to be_not_found
    expect(JSON.parse(response.body)['error']).to eq('To user not found.')
  end

  it "should return amount should be greater then 0" do
    post '/api/accounts/transfer.json', params: { from_user_id: 20, to_user_id: 1, amount: 0 }

    expect(response.status).to eq(422)
    expect(JSON.parse(response.body)['error']).to eq('Amount should be greater then 0.')
  end

  let(:from_user) { User.find 20 }
  let(:to_user) { User.find 1 }

  it "should return amount should be greater then 0" do
    from_user_balance = from_user.account_balance
    to_user_balance = to_user.account_balance
    post '/api/accounts/transfer.json', params: { from_user_id: 20, to_user_id: 1, amount: 10 }

    expect(response).to be_ok
    expect(from_user.reload.account_balance).to eq((from_user_balance - 10))
    expect(to_user.reload.account_balance).to eq((to_user_balance + 10))
  end
end