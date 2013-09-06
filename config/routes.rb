Foodomatic::Application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index]
  resources :queued_recipes, only: [:create]
  root 'recipes#index'
end
