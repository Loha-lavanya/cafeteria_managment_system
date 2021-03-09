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
      #@user = User.new(params[:user])
      user = User.create!(
        name: params[:name],
        email: params[:email],
        role: "user",
        password: params[:password],
      )
      UserMailer.signup_confirmation(user).deliver
    end
    redirect_to "/"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    #user = User.find(@current_user.id)
    # @user = User.find(params[:id])

    @user.name = params[:name]
    @user.email = params[:email]
    @user.password_digest = params[:password_digest]
    @user.save
=begin
    if @user.save
      #render plain: user.name
      #flash[:success] = "Profile Successfully Updated"
    end
=end
    redirect_to menu_items_path
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id])
    User.destroy(user.id)
  end
end
