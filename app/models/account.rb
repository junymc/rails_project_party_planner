class Account < ApplicationRecord
    has_secure_password
    belongs_to :accountable, :polymorphic => true, optional: true

    validates :email, uniqueness: true
    validates :email, presence: true
    validates :password, presence: true, on: :create
    validates :accountable_type, presence: true
    # validates :password, length: { in: 6..30 }, on: :create


    def self.from_omniauth(auth)
      # Creates a new user only if it doesn't exist
      where(email: auth.info.email).first_or_initialize do |account|
        account.email = auth.info.email
        account.password = Sysrandom.hex(30)
      end
    end

end
