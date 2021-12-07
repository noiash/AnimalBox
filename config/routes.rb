Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :users, only:[:show, :edit, :update] do
    get :followings, on: :member
    get :followers, on: :member
  end

  resources :pets, only:[:new, :create, :show, :update, :edit, :destroy]
  resources :posts, only:[:new, :create, :index, :show, :update, :edit, :destroy] do
    resource :likes, only:[:create, :destroy]

    resources :comments, only:[:create, :edit, :update, :destroy]

  end

  resources :votes do
    post 'vote', to: 'votes#vote'
  end

  resources :tags do
    get 'posts', to: 'posts#search'
  end

  resources :relationships, only: [:create, :destroy]

end
