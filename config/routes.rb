Foodomatic::Application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index]

  resources(:queued_recipes, only: [:create, :index, :destroy]) do
    post :sort, on: :collection
  end

  get "basket", to: 'basket#show'
  post "basket/add_to_basket", to: "basket#add_to_basket"
  get "basket/count_items", to: "basket#count_items"

  get "queue/count_items", to: "queued_recipes#count_items"

  root 'recipes#index'

end
