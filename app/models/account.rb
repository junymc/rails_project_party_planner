class Account < ApplicationRecord
    has_secure_password
    belongs_to :accountable, :polymorphic => true, optional: true

    validates :email, uniqueness: true
    validates :email, presence: true
    validates :password, presence: true, on: :create
    validates :password, length: { in: 6..20 }, on: :create

end
