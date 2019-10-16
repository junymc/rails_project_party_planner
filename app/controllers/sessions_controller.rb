class SessionsController < ApplicationController

    def login
        @account = Account.find_by(email: params[:email])
        if @account && @account.authenticate(params[:password])
				session[:id] = @account.id
				flash[:success] = "Welcome, #{@account.accountable.name}"
			if @account.accountable_type == "Host"
            	redirect_to host_path(@account.accountable)
			else
                redirect_to guest_path(@account.accountable)
            end
        else
            flash[:danger] = "Login credentials were not found, please try again."
            redirect_to login_path
        end
    end

    def logout
        Account.find(session[:id]).destroy
        redirect_to root_path
    end

end