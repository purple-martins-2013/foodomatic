Foodomatic::Application.routes.draw do
  resources :recipes, only: [:index]
  root 'recipes#index'
end
