Rails.application.routes.draw do
  namespace :admin do
    root 'application#index'

    resources :articles, except: [:index, :show]
    resources :comments, only: [:destroy]
  end
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

  resources :articles, only: [:index, :show, :edit, :update] do
    resources :comments 
  end

  scope path: "articles/:article_id", as: :article do
    resources :comments, only: [:create, :destroy]
    get "tags/remove/:id", to: "tags#remove", as: :remove_tag
  end
end
