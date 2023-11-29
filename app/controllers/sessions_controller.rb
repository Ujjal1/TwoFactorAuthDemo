class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password]) && user.verify_otp(params[:otp])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email, password, or OTP'
        render 'new'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully'
    end
  end
  