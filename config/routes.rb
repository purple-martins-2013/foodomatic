Foodomatic::Application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index]

  resources(:queued_recipes, only: [:create, :index]) do
    post :sort, on: :collection
  end

  post "basket/add_to_basket", to: "basket#add_to_basket"
  get "basket/count_items", to: "basket#count_items"

  get "basket", to: 'basket#show'

  root 'recipes#index'
end
