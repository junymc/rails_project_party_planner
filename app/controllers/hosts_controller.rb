class HostsController < ApplicationController
  def new
    session[:accountable_type] = "Host"
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
    @host.account = Account.find(session[:id])
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
