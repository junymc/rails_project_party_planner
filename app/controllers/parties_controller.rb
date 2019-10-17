class PartiesController < ApplicationController
 
  def index
    @parties = Party.all
    
  end

  def new
    @party = Party.new(party_params)
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def party_params
    params.require(:party).permit(:name, :desciption, :location, :date_time, :dress_code, :host_id)
  end
end
