class SessionsController < ApplicationController
  #before_action :ensure_user_logged_in

  def new
  end

  def create
    #authenticate method checks the password is true or not
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/menu"
    else
      render plain: "YOu have entered incorrect password"
    end
  end

  def index
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
