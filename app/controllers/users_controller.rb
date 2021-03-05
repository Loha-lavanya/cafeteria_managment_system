class UsersController < ApplicationController
  before_action :check_if_admin, only: [:destroy]

  def new
    render "users/new"
  end

  def create
    existing_user = User.find_by_email(params[:email])
    if existing_user
      flash[:error] = "User Already Exists"
    else
      user = User.create!(
        name: params[:name],
        email: params[:email],
        role: "user",
        password: params[:password],
      )
    end
    redirect_to "/"
  end

  def edit
    #@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Successfully Updated"
    else
      render "edit"
    end
    redirect_to menu_items_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
