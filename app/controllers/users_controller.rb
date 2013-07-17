class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    @user.save
    redirect_to user_path
  end

 def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:welcome] = "Thanks for registering with Arcader! You can now access our site!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end

end
