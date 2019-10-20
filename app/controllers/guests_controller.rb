class GuestsController < ApplicationController
  def new
    session[:accountable_type] = "Guest"
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    @guest.account = Account.find(session[:id])
    if @guest.save
      
      redirect_to parties_path
    else
      render :new
    end
  end

  def show
    @guest = Guest.find(params[:id])
  end

  # def invites_index
  #   @guest = Guest.find(params[:id])
  #   @invites = @guest.invites
  #   render template: 'invites/index'
  # end

  # def invite
  #   @guest = Guest.find(params[:id])
  #   @invite = Invite.find(params[:id])
  #   render template: 'invites/show'
  # end

  private

  def guest_params
    params.require(:guest).permit(:name, :age, :gender)
  end

end
