class HostsController < ApplicationController
  def new
    @host = Host.new
  end

  def create
    @host = Host.new(host_params)
    if @host.save
      session[:id] = @host.id
      redirect_to parties_path
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def host_params
    params.require(:host).permit(:name)
  end
end
