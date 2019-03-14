Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'
  get 'welcome/sign_in'
  get 'welcome/sign_up'
  get 'home/search'
  get 'home/friends'
  get 'home/about'
  get 'home/photos'

  resources :posts do
    resources  :comments
  end
  resources :posts do
    resources :likes
  end

  resources :comments do
    resources :likes
  end
  
  resources :friendships
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
