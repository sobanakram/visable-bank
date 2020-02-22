class Transaction < ApplicationRecord
  belongs_to :by_user, class_name: 'User'
  belongs_to :to_user, class_name: 'User'

  validates :amount, presence: true
  validates_numericality_of :amount, greater_than: 0
  validates :by_user_id, exclusion: { in: ->(user) { [user.to_user_id] } }

  alias :from_user :by_user
end
