Rails.application.routes.draw do
  resources :projects

  root 'pages#home'

  get '/auth/:provider/callback', to: 'sessions#create'

  get :sign_in, to: 'sessions#new'
  post :sign_out, to: 'sessions#destroy'
end
