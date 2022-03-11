class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ email: params["email"] })
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id
        #flash[:notice] = "Welcome, #{@user.username}."
        redirect_to "/places" 
      else
        flash[:notice] = "Login failed. Please try again."
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Unknown User"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are logged out now"
    redirect_to "/sessions/new"
  end
end
  