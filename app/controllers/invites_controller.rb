class InvitesController < ApplicationController

  def new
    @invite = Invite.new
    @party_id = params[:party_id]
    # binding.pry
  end

  def create
    @invite = Invite.new(invite_params)
  #  binding.pry
    if @invite.save
       redirect_to guest_invites_path(current_user)
    else
      @party_id= params[:party_id]
      render :new
    end
  end

  def index
    if params[:guest_id]
      @invites = Guest.find(params[:guest_id]).invites
      
    else
      @invites = Invite.all
    end
  end

  def show
    find_invite
  end

  def edit
    find_invite
  end

  def update
    find_invite
    @invite.update(invite_params)
    @invite.save
    redirect_to invites_path
  end

  def delete
  end

  private

  def invite_params
    params.require(:invite).permit(:add_on, :rsvp, :guest, :party_id)
  end

  def find_invite
    @invite = Invite.find(params[:id])
  end

end
