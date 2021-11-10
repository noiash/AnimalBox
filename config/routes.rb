Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :posts, only:[:new, :create, :index, :show, :update, :edit, :destroy]
  resources :users, only:[:show, :edit, :update]
  resources :pets
end
