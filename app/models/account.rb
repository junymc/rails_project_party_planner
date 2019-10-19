class Account < ApplicationRecord
    # attr_accessible :email, :provider, :uid, :password
    has_secure_password
    belongs_to :accountable, :polymorphic => true, optional: true

    validates :email, uniqueness: true
    validates :email, presence: true
    validates :password, presence: true, on: :create
    validates :password, length: { in: 6..20 }, on: :create

    # def self.create_with_omniauth(auth)
    #     where(auth.slice(:provider, :uid)).first_or_initialize.tap do |account|
    #         account.uid = auth.uid
    #         account.eamil = auth.info.eamil
    #         account.password = auth.info.password
    #         account.save!
    #     end
    # end

    #   private

    #   def auth
    #     request.env['omniauth.auth']
    #   end
    
end
