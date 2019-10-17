class ApplicationController < ActionController::Base


    def verify_accountable
        # get the account from session
        @account = Account.find(session[:id])
        # check if the account has an accountable
        redirect_to new_account_path if !@account.accountable?
        # if not, redirect to the appropriate new page based off of
        # session[:user_type]
        elsif session[:accountable_type] == "Host"
            redirect_to new_host_path
        elsif session[:accountable_type] == "Guest"
            redirect_to new_guest_path
        else
            redirect_to new_account_path
        end
    
    end


end
