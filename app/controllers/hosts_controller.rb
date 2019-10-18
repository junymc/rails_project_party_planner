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

  def edit
    @host = Host.find(session[:id])
    
  end

  def update
    @host = Host.find(session[:id])
    if @host.update(host_params)
       @host.save
       redirect_to host_path
    else
      render :edit
    end
  end

  def delete
    Host.find(session[:id]).destroy
    redirect_to root_path
  end

  private

  def host_params
    params.require(:host).permit(:name)
  end
end
