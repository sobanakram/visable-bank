require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'Transaction should not be valid' do
    let!(:transaction) { Transaction.new }

    it { expect(transaction).to_not be_valid }
  end

  context 'Transaction should not be valid with same user' do
    let!(:user) { User.create(name: 'soban', username: 'soban') }
    let!(:transaction) { Transaction.new(by_user: user, to_user: user, amount: 10) }

    it { expect(transaction).to_not be_valid }
  end

  context 'Transaction should not be valid with zero or negative amount' do
    let!(:user) { User.create(name: 'soban', username: 'soban') }
    let!(:user_2) { User.create(name: 'Akram', username: 'akram') }
    let!(:transaction) { Transaction.new(by_user: user, to_user: user_2, amount: 0) }
    let!(:transaction_2) { Transaction.new(by_user: user, to_user: user_2, amount: -10) }

    it { expect(transaction).to_not be_valid }
    it { expect(transaction_2).to_not be_valid }
  end

  context 'Transaction should be valid' do
    let!(:user) { User.create(name: 'soban', username: 'soban') }
    let!(:user_2) { User.create(name: 'Akram', username: 'akram') }
    let!(:transaction) { Transaction.create(by_user: user, to_user: user_2, amount: 10) }

    it { expect(transaction).to be_valid }
    it { expect(transaction).to be_persisted }
  end
end
