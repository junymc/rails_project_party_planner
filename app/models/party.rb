class Party < ApplicationRecord
    belongs_to :host
    has_many :invites
    has_many :guests, through: :invites

    def strf_time
        date_time.strftime("%d %b %Y %l:%M %p")
    end
end
