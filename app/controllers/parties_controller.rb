class PartiesController < ApplicationController
 before_action :verify_accountable
 before_action :find_party, :party_host, only: [:edit, :update, :destroy]
 
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
    if authorized_host
      render :edit
    else
      flash[:danger] = "You are not an authorized user."
      redirect_to party_path(@party)
    end
  end

  def update
      if authorized_host
        @party.update(party_params)
        redirect_to host_party_path(@party.host, @party)
      else
        flash[:danger] = "You are not an authorized user."
        redirect_to parties_path
      end
  end

  def destroy
    @host = @party.host
    if authorized_host
      @party.destroy
      redirect_to host_path(current_user)
    else
      flash[:danger] = "You are not an authorized user."
      redirect_to parties_path
    end
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

  def party_host
    if params[:host_id]
      find_host
      @party.host = @host
    end
  end

  def authorized_host
    current_user == @host
  end

end
