class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      render :index
    end

  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to "#{post_path(@post.id)}#comment_#{@comment.id}"
    #redirect_to post_path(@post.id)
  end


  def destroy
    @comment = Comment.find_by(params[:id])
    if @comment.destroy
      render :index
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end

end
