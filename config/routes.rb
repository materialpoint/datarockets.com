Rails.application.routes.draw do
  resources :questions

  root 'pages#home'
end
