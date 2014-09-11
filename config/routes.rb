Rails.application.routes.draw do
  root 'pages#home'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :client_contacts, only: [:create]

  namespace :admin do
    root '/admin#index'
    resources :pages, except: [:show]
    resources :post_images, only: [:create]
    resources :posts, except: [:show]
    resources :project_images, only: [:create]
    resources :projects, except: [:show]
    resources :questions, except: [:show]
    resources :users
  end

  namespace :blog do
    resources :posts
  end

  resources :pages, only: [:show]
  resources :projects, only: [:index, :show]
  resources :questions, only: [:index, :show]

  get :sign_in, to: 'sessions#new'
  post :sign_out, to: 'sessions#destroy'

  resource :team, only: [:show]
end
