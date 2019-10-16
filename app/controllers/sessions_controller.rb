class SessionsController < ApplicationController

    def login
        redirect_to parties_path
    end

    def logout
        redirect_to root_path
    end

end