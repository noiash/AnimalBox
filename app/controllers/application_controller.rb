class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    #@search = Article.search(params[:q])
    @search = Post.ransack(params[:q])
    @search_posts = @search.result.page(params[:page])
  end

  def after_sign_in_path_for(resource)
    posts_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :profile_image, :introduction])
    end

end
