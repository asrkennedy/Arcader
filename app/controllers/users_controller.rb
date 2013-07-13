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
    @user = User.create!(params[:user])

    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice: "Welcome to Arcader! Let's play!" }
        format.json { render json: @user, status: :created, location: @user}
      else
        format.html { render action: "new"}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
