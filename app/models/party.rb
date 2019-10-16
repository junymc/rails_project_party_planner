class Party < ApplicationRecord
    belongs_to :host
    has_many :invites
    has_many :guests, through: :invites
end
