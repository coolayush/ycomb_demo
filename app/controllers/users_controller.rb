class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
	  @user = User.new(user_params)
	  if @user.save
      @articles = Article.reverse_chrono
      session[:user_id] = @user.id
      flash[:success] = "Sucessfully signed up"
	  else
	  	flash.now[:error] = @user.errors.full_messages.join("\n")
	  	@user = nil
	  end

	end

	private

	def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
	end
end
