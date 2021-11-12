class RelationshipsController < ApplicationController
 before_action :set_user, only:[:index, :create, :destroy]

  def create
    following = current_user.follow(@user)
    following.save
      respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private

  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end

end