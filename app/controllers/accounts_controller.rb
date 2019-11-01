class AccountsController < ApplicationController
  def new
    if logged_in?
      redirect_to parties_path
    else
      render :new
    end
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    
    if @account.save
      session[:id] = @account.id
      session[:accountable_type] = params[:account][:accountable_type]
      
      if params[:account][:accountable_type] == "Host"
         redirect_to new_host_path
      elsif params[:account][:accountable_type] == "Guest" 
         redirect_to new_guest_path
      end
    else
      render :new
    end
  end

  private

  def account_params
    params.require(:account).permit(:email, :password, :accountable_type)
  end

end
