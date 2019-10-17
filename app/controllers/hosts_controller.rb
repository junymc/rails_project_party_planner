class HostsController < ApplicationController
  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
    # binding.pry
    if @host.save
      session[:id] = @host.id
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
    @host = Host.update(host_params)
    @host.save
  end

  def delete
  end

  private

  def host_params
    params.require(:host).permit(:name)
  end
end