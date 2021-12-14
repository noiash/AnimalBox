class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:search]

  def index
    @tag_list = Tag.all
    unless params[:q]
      @posts = Post.all.reverse_order.page(params[:page]).per(9)
    end
    @post = current_user.posts.new
  end

  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end


  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
    @comment = Comment.new
    @comments = @post.comments
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(/[[:space:]]/)
    if @post.save
       @post.save_tag(tag_list)
       redirect_to posts_path
    else
       render :new
    end

  end

  def edit
    @post = Post.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    tag_list = params[:post][:tag_name].split(/[[:space:]]/)
    @post.save_tag(tag_list)
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
