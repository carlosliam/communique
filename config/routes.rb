Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, format: { default: :json } do
    resource :feed, only: [:show]
    resource :search, only: [:show]
    resources :users, only: [:create, :show, :update] do
      resource :follow, only: [:create, :destroy]
    end
    resource :tag, only: [:show]
    resource :session, only: [:create, :destroy]
    resources :posts, only: [:create, :show, :update] do
      resources :comments, only: [:create, :index]
      resource :like, only: [:create, :destroy]
    end
  end

  root 'static_pages#root'
end
