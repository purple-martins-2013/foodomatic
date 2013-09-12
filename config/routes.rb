Foodomatic::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  

  resources :recipes, only: [:create, :new, :edit, :index, :update] do
    resources :ingredients, only: [:create]
  end

  resources :products, only: [:index]

  resources(:favorite_recipes, only: [:create, :index, :destroy]) do
    post :sort, on: :collection
  end

  resources :orders, only: [:create, :show]
  resources :ordered_products, only: [:create]

  get "basket", to: 'basket#show'
  post "basket/add_to_basket", to: "basket#add_to_basket", as: 'add_to_basket'
  delete "basket/delte_from_basket", to: "basket#remove_from_basket", as: 'remove_from_basket'

  get 'favorites/count_items', to: 'favorite_recipes#count_items'
  get 'basket/count_items', to: 'basket#count_items'

  root 'recipes#index'
end
