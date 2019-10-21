class Invite < ApplicationRecord
    belongs_to :party
    belongs_to :guest

    validates :add_on, :rsvp, presence: true
    # accepts_nested_attributes_for :guest, :party
end
