class ApplicationController < ActionController::Base


    def verify_accountable
        # get the account from session
        # check if the account has an accountable
        # if not, redirect to the appropriate new page based off of
        # session[:user_type]
    end


end
