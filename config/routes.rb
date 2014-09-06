Rails.application.routes.draw do
  root 'pages#home'

  get '/auth/:provider/callback', to: 'sessions#create'

  namespace :admin do
    resources :post_images, only: [:create]
    resources :posts, except: [:show]
    resources :projects, except: [:show]
  end

  resources :projects, only: [:index, :show]

  namespace :blog do
    resources :posts
  end

  get :sign_in, to: 'sessions#new'
  post :sign_out, to: 'sessions#destroy'
end
