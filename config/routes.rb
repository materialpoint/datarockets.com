Rails.application.routes.draw do
  root 'pages#home'

  get '/auth/:provider/callback', to: 'sessions#create'

  resource :team, only: [:show]
  resources :questions

  namespace :admin do
    resources :projects, except: [:show]
    resources :questions, except: [:show]
  end

  resources :projects, only: [:index, :show]
  resources :questions, only: [:index, :show]

  get :sign_in, to: 'sessions#new'
  post :sign_out, to: 'sessions#destroy'
end
