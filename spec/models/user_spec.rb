require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User should not be valid' do
    let!(:user) { User.new }

    it { expect(user).to_not be_valid }
  end

  context 'User should have unique username' do
    let!(:user) { User.create(name: 'soban', username: 'soban') }
    let!(:user_2) { User.new(name: 'Akram', username: 'soban') }

    it { expect(user_2).to_not be_valid }
  end

  context 'User should be valid' do
    let!(:user) { User.create(name: 'soban', username: 'soban') }

    it { expect(user).to be_valid }
    it { expect(user).to be_persisted }
    it { expect(user.account_balance).to eq(0) }
  end
end
