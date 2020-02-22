class TransferService


  def initialize(from_user_id, to_user_id, amount)
    raise 'Amount should be greater then 0.' if amount <= 0

    @from_user = User.find_by_id from_user_id
    raise ActiveRecord::RecordNotFound.new 'From user not found.' if @from_user.nil?

    @to_user = User.find_by_id to_user_id
    raise ActiveRecord::RecordNotFound.new 'To user not found.' if @to_user.nil?

    @amount = amount
    raise 'From user doesn\'t have enough balance to transfer.' if @from_user.account_balance < @amount
  end

  def transfer!
    Transaction.transaction do
      Transaction.create!(by_user: @from_user, to_user: @to_user, amount: @amount)
      @from_user.decrement!(:account_balance, @amount)
      @to_user.increment!(:account_balance, @amount)
    end
  end
end