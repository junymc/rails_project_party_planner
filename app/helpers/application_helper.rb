module ApplicationHelper
    def already_joined
        @party = Party.find(params[:id])
        @invites = Invite.all.where("guest_id = ? OR party_id = ?", current_user, @party.id)
      end
end
