Rails.application.routes.draw do
  get 'home/index'

  resources :posts do
    resources  :comments
  end
  resources :posts do
    resources :likes
  end

  resources :comments do
    resources :likes
  end
  
  devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
