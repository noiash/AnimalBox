class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).reverse_order
    @pets = @user.pets.page(params[:page]).reverse_order
    @relationship = current_user.relationships.find_by(follow_id: @user.id)
    @set_relationship = current_user.relationships.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.all
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
