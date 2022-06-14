Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :ingredient_pantries, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:show, :index] do
    resources :favorite_recipes, only: [:create]
  end

  resources :favorite_recipes, only: [:destroy]
  resources :ingredient_pantries, except: :show
  resources :recipes, only: [:show, :index]
  get "profile", to: "pages#profile"
  get "landing", to: "pages#landing"
  resources :tasks, except: [:show, :new] do
    patch "complete", to: "tasks#complete"
  end
  get "yourfavorite", to: "pages#yourfavorite"


  # resource :basket, only: [:show, :update, :destroy]

  # resolve("Basket") { route_for(:basket) }
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
