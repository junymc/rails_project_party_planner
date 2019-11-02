class Host < ApplicationRecord
    has_one :account, :as => :accountable
    has_many :parties

    validates :name, presence: true

    def self.has_most_parties
        joins(:parties)
           .group("host_id")
           .count.max_by{|k,v| v}[0]
    end
end
