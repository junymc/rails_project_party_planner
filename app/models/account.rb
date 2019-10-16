class Account < ApplicationRecord
    has_secure_password
    belongs_to :accountable, :polymorphic => true

    validates :email, uniqueness: true
    validates :email, :password, presence: true
    validates :password, length: { in: 6..20 }

end
