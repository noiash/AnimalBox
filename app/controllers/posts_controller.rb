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
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :image_id, :video_id)
  end

end
