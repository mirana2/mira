Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :articles
      resources :categories
      resources :pending_articles

      root to: "users#index"
    end
  resources :articles
  resources :categories
  resources :pending_articles

  root to: 'articles#index'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
