class ApplicationController < ActionController::Base


    def verify_accountable
        # get the account from session
        @account = Account.find(session[:id])
        # check if the account has an accountable
        if !@account.accountable
        # if not, redirect to the appropriate new page based off of
        # session[:user_type]
            if session[:accountable_type] == "Host"
                redirect_to new_host_path
            else
                redirect_to new_guest_path
            end
        end
    end

    def current_user
        if session[:id]
            @current_user ||= Account.find(session[:id])
        else
            @current_user = nil
        end
    end

    


end
