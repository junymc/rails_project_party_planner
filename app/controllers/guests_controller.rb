class GuestsController < ApplicationController
  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    # binding.pry
    if @guest.save
      session[:id] = @guest.id
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

  def guest_params
    params.require(:guest).permit(:name, :age, :gender)
  end

end
