Foodomatic::Application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index]
  root 'recipes#index'
end
