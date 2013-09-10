Foodomatic::Application.routes.draw do
  devise_for :users

  resources :recipes, only: [:create, :new, :edit, :index, :update] do
    resources :ingredients, only: [:create]
  end

  resources :products, only: [:index]

  resources(:favorite_recipes, only: [:create, :index, :destroy]) do
    post :sort, on: :collection
  end

  get "basket", to: 'basket#show'
  post "basket/add_to_basket", to: "basket#add_to_basket", as: 'add_to_basket'
  get "basket/count_items", to: "basket#count_items"

  get "favorites/count_items", to: "favorite_recipes#count_items"

  root 'recipes#index'

end
