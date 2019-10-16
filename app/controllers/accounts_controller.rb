class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.create(account_params)
    binding.pry
    if @account.host
      redirect_to home_path
    elsif @account.guest
      redirect_to guest_path
    else
      redirect_to root_path
    end
  end

  private

  def account_params
    params.require(:account).permit(:email, :password_digest)
  end

end
