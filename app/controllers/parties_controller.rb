class PartiesController < ApplicationController
 before_action :verify_accountable
 
  def index
    @parties = Party.all
    
  end

  def new
    host?
    if params[:host_id]
      find_host
    end
    @party = Party.new
  end

  def create
    host?
    @party = Party.new(party_params)
    if params[:host_id]
      find_host
      @party.host = @host
    end
  
    if @party.save
      redirect_to host_party_path(@party.host, @party)
    else
      render :new
    end
  end

  def show
    find_party
  end

  def edit
    authorized_host?
    find_party
    if params[:host_id]
      find_host
      @party.host = @host
    end
  end

  def update
    if authorized_host?
       find_party
      @party.update(party_params)
      if params[:host_id]
        find_host
        @party.host = @host
      end
      redirect_to host_party_path(@party.host, @party)
    else
      flash[:danger] = "You are not authorized to edit the party."
      redirect_to parties_path
    end
  end

  def delete
    find_party
    @party.destroy
    redirect_to parties_path
  end

  private

  def party_params
    params.require(:party).permit(:name, :description, :location, :date_time, :dress_code, :host_id)
  end

  def find_party
    @party = Party.find(params[:id])
  end

  def find_host
    @host = Host.find(params[:host_id])
  end
end
