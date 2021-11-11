Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :users, only:[:show, :edit, :update] do
    member do
      get :followings, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end



  resources :pets, only:[:new, :create, :index, :show, :update, :edit, :destroy]
  resources :posts, only:[:new, :create, :index, :show, :update, :edit, :destroy] do
    resource :likes, only:[:create, :destroy]

    resources :comments, only:[:create, :destroy]

  end

  resources :tags do
    get 'posts', to: 'posts#search'
  end

end
