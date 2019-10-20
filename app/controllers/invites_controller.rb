class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    
  end

  def create
    @invite = Invite.create(invite_params)
    @party = Party.find(params[:id])
    @guest = Guest.find(params[:id])
    @guest.party = @party
    binding.pry
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def invite_params
    params.require(:invite).permit(:add_on, :rsvp, :guest, :party)
  end
end
