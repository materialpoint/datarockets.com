Rails.application.routes.draw do
  root 'pages#home'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :client_contacts, only: [:create]

  namespace :admin do
    root '/admin#index'
    resources :post_images, only: [:create]
    resources :posts, except: [:show]
    resources :project_images, only: [:create]
    resources :projects, except: [:show]
    resources :questions, except: [:show]
  end

  resources :projects, only: [:index, :show]
  resources :questions, only: [:index, :show]

  namespace :blog do
    resources :posts
  end

  get :sign_in, to: 'sessions#new'
  post :sign_out, to: 'sessions#destroy'

  resource :team, only: [:show]
end
