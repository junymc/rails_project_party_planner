class WelcomeController < ApplicationController
    def root
        @parties = Party.all
    end
end