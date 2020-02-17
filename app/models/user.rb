class User < ApplicationRecord

  has_many :my_transactions, class_name: 'Transaction', foreign_key: :by_user_id
  has_many :against_me_transactions, class_name: 'Transaction', foreign_key: :to_user_id

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates_numericality_of :account_balance, greater_than_or_equal_to: 0

  def transactions
    my_transactions.or(against_me_transactions)
  end
end
