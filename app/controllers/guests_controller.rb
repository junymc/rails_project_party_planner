class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.account = Account.find(session[:id])
    # binding.pry
    if @guest.save
      
      redirect_to parties_path
    else
      render :new
    end
  end

  def show
    @guest = Guest.find(params[:id])
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :age, :gender)
  end

end
