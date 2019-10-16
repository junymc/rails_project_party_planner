class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.create(account_params)
    # binding.pry
    if @host
      redirect_to new_host_path
    elsif @guest
      redirect_to new_guest_path
    else
      redirect_to root_path
    end
  end

  private

  def account_params
    params.require(:account).permit(:email, :password_digest)
  end

end
