class SessionsController < ApplicationController
  def new

  end

  def create
	  @user = User.authenticate(params[:email], params[:password])
	  if @user
	  	session[:user_id] = @user.id
	    flash[:notice] = "Logged in!"
	  else
	    flash.now[:error] = "Invalid email or password"
	  end
	end

	def destroy
	  session[:user_id] = nil
	  flash[:notice] = "Logged out!"
	end
end
