class ApplicationController < ActionController::Base
    helper_method :current_account, :current_user, :user_type, :host?, :logged_in?

    rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
    rescue_from ActionController::RoutingError, :with => :rescue404


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

    def log_in(account)
        session[:id] = account.id
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
        current_account.accountable_type == "Host"
    end

    def logged_in?
        !!current_user
    end

    private

    def rescue404
        render(:file => File.join(Rails.root, 'public/404.html'), :status => 404, :layout => false)
    end

    def rescue403
        render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end


end
