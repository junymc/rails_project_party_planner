class Guest < ApplicationRecord
    has_one :account, :as => :accountable
    has_many :invites
    has_many :parties, through: :invites

    validates :name, :age, presence: true
end
