class PartiesController < ApplicationController
 
  def index
    @parties = Party.all
    
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    if @party.save
      redirect_to host_party_path
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

  def party_params
    params.require(:party).permit(:name, :description, :location, :date_time, :dress_code, :host_id)
  end
end
