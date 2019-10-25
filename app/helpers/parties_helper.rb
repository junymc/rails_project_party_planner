module PartiesHelper
    def already_joined
        @party = Party.find(params[:id])
        @invite = Invite.where("guest_id = ? OR party_id = ?", current_user, @party.id)
      end
end
