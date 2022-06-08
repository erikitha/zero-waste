Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :ingredient_pantries, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:show, :index]

  # resource :basket, only: [:show, :update, :destroy]

  # resolve("Basket") { route_for(:basket) }
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
