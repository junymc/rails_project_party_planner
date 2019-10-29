class Guest < ApplicationRecord
    has_one :account, :as => :accountable
    has_many :invites
    has_many :parties, through: :invites

    validates :name, :age, presence: true
    validates :age, numericality: { greater_than: 19, less_than: 90}

    scope :female, -> { where(gender: :female) }
    scope :female_and_adult, -> { female.where("age > 20") }
end
