class InvitesController < ApplicationController
  before_action :find_invite, only: [:show, :edit, :update, :destroy]
  
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
  
  end

  def edit
    if authorized_guest
      render :edit
    else
      flash[:danger] = "You are not an authorized user."
      redirect_to parties_path
    end
  end

  def update
    if authorized_guest
      @invite.update(invite_params)
      redirect_to guest_path(current_user)
    else
      flash[:danger] = "You are not an authorized user."
      redirect_to parties_path
    end
  end

  def destroy
    if authorized_guest
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

  def authorized_guest
    current_user == @invite.guest
  end

end
