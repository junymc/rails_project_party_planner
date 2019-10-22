class Invite < ApplicationRecord
    belongs_to :party
    belongs_to :guest

    validates :add_on, :rsvp, presence: true
    
end
