class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    # binding.pry
    if @account.save
      session[:id] = @account.id
      session[:user_type] = params[:account][:user_type]
      if params[:account][:user_type] == "Host"
         redirect_to new_host_path
      elsif params[:account][:user_type] == "Guest" 
         redirect_to new_guest_path
      else
         redirect_to root_path
      end
    else
      render :new
    end
  end

  private

  def account_params
    params.require(:account).permit(:email, :password)
  end

end
