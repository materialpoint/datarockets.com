Rails.application.routes.draw do
  root 'pages#home'

  get '/auth/:provider/callback', to: 'sessions#create'

  resources :projects

  get :sign_in, to: 'sessions#new'
  post :sign_out, to: 'sessions#destroy'
end
