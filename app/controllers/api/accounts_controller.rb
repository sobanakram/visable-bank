module Api
  class AccountsController < ApiController

    api :GET, 'accounts/balance.json', 'Get user account balance'
    param :user_id, Integer, required: true

    def balance
      user = User.find_by_id params[:user_id]
      return render_error('User not found.', 404) if user.nil?

      render_success({ balance: user.account_balance })
    end

    api :POST, 'account/transfer.json', 'Transfer amount from one account to other'
    param :from_user_id, Integer, desc: 'User id of user who wants to transfer amount.', required: true
    param :to_user_id, Integer, desc: 'User id of user to whom amount will be transferred.', required: true
    param :amount, Float, required: true

    def transfer
      render_error('Amount should be greater then 0.') && return if params[:amount].to_f <= 0

      from_user = User.find_by_id params[:from_user_id]
      return render_error('From user not found.', 404) && return if from_user.nil?

      to_user = User.find_by_id params[:to_user_id]
      render_error('To user not found.', 404) && return if to_user.nil?

      transfer_service = TransferService.new(from_user.id, to_user.id, params[:amount].to_f)
      render_success({ message: 'Amount transferred.' }) if transfer_service.transfer!
    end
  end
end