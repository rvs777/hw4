class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ email: params["email"] })
    if @user
      if @user.password == params["password"]
        redirect_to "/places"
      else
        flash[:notice] = "Nope"
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Nope"
      redirect_to "/sessions/new"
    end
    
  end

  def destroy

  end
end
  