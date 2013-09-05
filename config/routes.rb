Foodomatic::Application.routes.draw do
  resources :recipes, only: [:index]
  root 'main#index'
end
