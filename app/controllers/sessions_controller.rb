class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to parties_path
        else
            render :new
        end
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

    def googleAuth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        @account = Account.from_omniauth(access_token)
        # log_in(@account)
        # Access_token is used to authenticate request made from the rails application to the google server
        @account.google_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        @account.google_refresh_token = refresh_token if refresh_token.present?
        if @account.save
           session[:id] = @account.id
           if @account.accountable == nil
            redirect_to auth_login_path
           elsif @account.accountable != nil
            redirect_to parties_path
           end
        else
            flash[:danger] = "Something went wrong, try again!"
            redirect_to root_path
        end

    end

    def auth_login
        @account = Account.find(session[:id])
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