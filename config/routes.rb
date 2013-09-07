Foodomatic::Application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index]

  resources(:queued_recipes, only: [:create, :index]) do
    post :sort, on: :collection
  end

  get "basket", to: 'basket#show'

  root 'recipes#index'
end
