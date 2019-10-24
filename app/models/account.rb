class Account < ApplicationRecord
    # attr_accessible :email, :provider, :uid, :password
    has_secure_password
    belongs_to :accountable, :polymorphic => true, optional: true

    validates :email, uniqueness: true
    validates :email, presence: true
    validates :password, presence: true, on: :create
    # validates :password, length: { in: 6..30 }, on: :create

    def self.create_with_omniauth(auth)
        @account = find_or_create_by(uid: auth['uid'], provider:  auth['provider'])
        @account.email = "#{auth['uid']}@#{auth['provider']}.com"
        @account.password = Sysrandom.hex(30)
        
        if Account.exists?(@account.id)
          @account
        else
          @account.save!
          @account
        end
    end

end
