class HostsController < ApplicationController
  def new
    @host = Host.new
  end

  def create
    # @account = current_account
    @host = Host.new(host_params)
    @host.account = Account.find(session[:id])
    # session[:id] = @host.account.id
    if @host.save
     
      redirect_to parties_path
    else
      render :new
    end
  end

  def show
    @host = Host.find(session[:id])
  end

  private

  def host_params
    params.require(:host).permit(:name)
  end
end
