Rails.application.routes.draw do
  get 'welcome/sign_in'
  get 'welcome/sign_up'
  get 'users/show'
  get 'users/search'
  get 'users/friends'
  get 'users/about'
  get 'users/photos'
  get 'my_profiles/requests'
  get 'my_profiles/friends'
  get 'my_profiles/about'
  get 'my_profiles/photos'
  get 'my_profiles/timeline'

  resource :my_profile

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

  root 'my_profiles#timeline'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
