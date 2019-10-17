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
    @guest = Guest.find(session[:id])
  end

  def update
    @guest = Guest.find(session[:id])
    if @guest.update(guest_params)
       @guest.save
       redirect_to guest_path
    else
      render :edit
    end
  end

  def delete
    Guest.find(session[:id]).destroy
    redirect_to root_path
  end

  private

  def guest_params
    params.require(:guest).permit(:name, :age, :gender)
  end

end
