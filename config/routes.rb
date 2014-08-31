Rails.application.routes.draw do
  root 'pages#home'

  get '/auth/:provider/callback', to: 'sessions#create'

  namespace :admin do
    resources :projects, except: [:show]
    resources :questions, except: [:show]
  end

  resources :client_contacts, only: [:create]

  resources :projects, only: [:index, :show]
  resources :questions, only: [:index, :show]

  get :sign_in, to: 'sessions#new'
  post :sign_out, to: 'sessions#destroy'
end
