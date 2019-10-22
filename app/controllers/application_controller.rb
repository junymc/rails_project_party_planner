class ApplicationController < ActionController::Base
    helper_method :current_account, :current_user, :user_type, :host?, :authorized_host?


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

    def current_account
        Account.find_by(id: session[:id])
    end

    def current_user
        if c = current_account
            c.accountable
        end
    end

    def user_type
        if c = current_account
            c.accountable_type
        end
    end

    def host?
        a = Account.find(session[:id])
        redirect_to guest_path(a.accountable) if a.accountable_type != "Host" 
    end

    def authorized_host?
        if current_user
           id = current_user.id
           id.to_s == params[:host_id]
        else
            redirect_to parties_path
        end
    end


end
