class Party < ApplicationRecord
    belongs_to :host
    has_many :invites
    has_many :guests, through: :invites

    validates :name, :description, :location, :date_time, presence: true

    def strf_time
        date_time.strftime("%d %b %Y %l:%M %p")
    end
end
