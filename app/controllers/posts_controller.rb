class PostsController < ApplicationController

  def index
    @tag_list = Tag.all
    @posts = Post.all
    @post = current_user.posts.new
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
       @post.save_tag(tag_list)
       redirect_to posts_path
    else
       redirect_to posts_path
    end

  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :image_id, :video_id)
  end

end
