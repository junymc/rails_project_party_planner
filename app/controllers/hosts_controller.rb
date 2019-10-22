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
    @host = Host.find(params[:id])
    # binding.pry
    @parties = Party.all.where(host_id: @host.id)
    @party = Party.find_by(host_id: @host.id)
  end

  private

  def host_params
    params.require(:host).permit(:name)
  end
end
