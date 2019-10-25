class InvitesController < ApplicationController

  def new
    @invite = Invite.new
    @party_id = params[:party_id]
  end

  def create
    @party = Party.find(params[:party_id])
    @invite = Invite.new(invite_params)
    @invite.guest = current_user
    @invite.party = @party
    if @invite.save
       redirect_to guest_path(current_user)
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
    redirect_to guest_path(current_user)
  end

  def destroy
    find_invite
    if @invite.guest == current_user
      @invite.destroy
      redirect_to guest_path(current_user)
    else
      flash[:danger] = "You are not an authorized user."
      redirect_to guest_path(current_user)
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:add_on, :rsvp, :guest)
  end

  def find_invite
    @invite = Invite.find(params[:id])
  end

end
