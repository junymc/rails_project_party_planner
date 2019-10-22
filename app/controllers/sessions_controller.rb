class SessionsController < ApplicationController

    def new
    end

    def create
        @account = Account.find_by(email: params[:email])
        # binding.pry
        if @account && @account.authenticate(params[:password])
			session[:id] = @account.id
			flash[:success] = "Welcome, #{@account.email}"
			
            redirect_to parties_path
        else
            flash[:danger] = "Login credentials were not found, please try again."
            redirect_to login_path
        end
    end

    def login_with_facebook
        if request.env['omniauth.auth']
            @account = Account.create_with_omniauth(request.env['omniauth.auth'])
            session[:id] = @account.id    
            redirect_to auth_login_path
          else
            @account = Account.find_by_email(params[:email])
            @account && @account.authenticate(params[:password])
            session[:id] = @account.id
            redirect_to parties_path
          end
    end

    def auth_login

    end

    def destroy
        session.delete(:id)
        # session[:id] = nil
        flash[:success] = "Goodbye!"
        redirect_to root_path
    end


end