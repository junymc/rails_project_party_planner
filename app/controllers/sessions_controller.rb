class SessionsController < ApplicationController

    def new
    end

    def create
        @account = Account.find_by(email: params[:email])
        # binding.pry
        if @account && @account.authenticate(params[:password])
			session[:id] = @account.id
			flash[:success] = "Welcome, #{@account.email}"
			# if @account.accountable_type == "Host"
            # 	redirect_to host_path
			# else
            #     redirect_to guest_path
            # 
            redirect_to parties_path
        else
            flash[:danger] = "Login credentials were not found, please try again."
            redirect_to root_path
        end
    end

    def destroy
        session.delete(:id)
        # session[:id] = nil
        flash[:success] = "Goodbye!"
        redirect_to root_path
    end

end