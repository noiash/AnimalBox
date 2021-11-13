class RelationshipsController < ApplicationController
 before_action :set_user, only:[:index, :create, :destroy]

  def create
    following = current_user.follow(@user)
    following.save
    @relationship = current_user.relationships.find_by(follow_id: @user.id)
  end

  def destroy
    following = current_user.unfollow(@user)
    following.destroy
    @set_relationship = current_user.relationships.new
  end

  private

  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end

end