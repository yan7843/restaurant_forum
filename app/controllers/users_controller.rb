class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    @commented_restaurants = @user.restaurants
  end

  def edit
    unless @user == current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def index
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end

end
