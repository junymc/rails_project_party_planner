class WelcomeController < ApplicationController
    def root
        @parties = Party.all
    end

    def best_host
        @host_id = Host.has_most_parties
        @host = Host.find_by(id: @host_id)
    end
end