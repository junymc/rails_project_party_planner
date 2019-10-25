class SessionsController < ApplicationController

    def new
    end

    def create
        @account = Account.find_by(email: params[:email])
        if @account && @account.authenticate(params[:password])
			session[:id] = @account.id
			flash[:success] = "Welcome, #{@account.email}"
			
            redirect_to parties_path
        else
            flash[:danger] = "Somthing went wrong, please try again."
            redirect_to login_path
        end
    end

    def login_with_facebook
        if request.env['omniauth.auth']
            @account = Account.create_with_omniauth(request.env['omniauth.auth'])
            session[:id] = @account.id 
            redirect_to auth_login_path
            
        else
            current_account
            current_account && current_account.authenticate(params[:password])
            session[:id] = @account.id
            redirect_to account_path(@account)
          end
    end

    def auth_login

    end

    def destroy
        session.delete(:id)
        flash[:success] = "Goodbye!"
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
        
end