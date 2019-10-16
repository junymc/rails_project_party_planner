class Host < ApplicationRecord
    has_one :account, :as => :accountable
    has_many :parties

    validates :name, presence: true
end
